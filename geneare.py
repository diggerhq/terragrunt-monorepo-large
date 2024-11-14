import os
import random
from pathlib import Path
from typing import List, Dict, Set
import json

class DependencyGenerator:
    def __init__(self):
        self.all_paths: Set[str] = set()
        self.dependency_map: Dict[str, List[str]] = {}
        
    def add_path(self, path: str):
        self.all_paths.add(path)
        self.dependency_map[path] = []
        
    def generate_dependencies(self, current_path: str, max_deps: int = 5) -> List[str]:
        possible_deps = [p for p in self.all_paths 
                        if p != current_path 
                        and not p.startswith(str(Path(current_path).parent))]
        
        num_deps = random.randint(0, min(max_deps, len(possible_deps)))
        deps = random.sample(possible_deps, num_deps) if possible_deps else []
        
        self.dependency_map[current_path] = deps
        return deps

def generate_root_config():
    return '''# Root terragrunt.hcl
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "${local.account_vars.account_id}-terraform-states"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.region_vars.aws_region
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = local.region_vars.aws_region
  
  assume_role {
    role_arn = local.account_vars.role_arn
  }
}
EOF
}

locals {
  # Load account variables
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl", "ignore"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl", "ignore"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl", "ignore"))

  # Extract commonly used variables
  account_name = local.account_vars.locals.account_name
  account_id   = local.account_vars.locals.account_id
  aws_region   = local.region_vars.locals.aws_region
}

inputs = {
  aws_region   = local.aws_region
  account_name = local.account_name
  account_id   = local.account_id
  
  tags = {
    ManagedBy   = "Terragrunt"
    Environment = local.env_vars.locals.environment
  }
}'''

class TerragruntGenerator:
    def __init__(self):
        self.dependency_gen = DependencyGenerator()
        
        self.regions = ['us-east-1', 'us-west-2', 'eu-west-1', 'ap-southeast-1']
        self.environments = ['dev', 'staging', 'qa', 'prod']
        self.business_units = ['finance', 'marketing', 'operations', 'engineering']
        self.service_categories = ['data', 'platform', 'application', 'security']
        
        self.module_types = {
            'network': [
                'vpc', 'subnet', 'nacl', 'route-table', 'transit-gateway', 
                'vpn', 'direct-connect', 'endpoint'
            ],
            'compute': [
                'eks', 'ec2', 'lambda', 'batch', 'ecs', 'fargate', 
                'auto-scaling', 'spot-fleet'
            ],
            'storage': [
                's3', 'efs', 'fsx', 'rds', 'dynamodb', 'elasticache', 
                'redshift', 'backup'
            ],
            'security': [
                'iam', 'kms', 'secrets', 'certificates', 'waf', 'shield', 
                'guardduty', 'security-hub'
            ],
            'monitoring': [
                'cloudwatch', 'prometheus', 'grafana', 'alertmanager', 
                'log-aggregation', 'trace-collection'
            ],
            'application': [
                'api-gateway', 'load-balancer', 'service-mesh', 'queue', 
                'event-bus', 'cache-layer'
            ]
        }

    def generate_account_hcl(self, env: str) -> str:
        account_ids = {
            'dev': '111111111111',
            'staging': '222222222222',
            'qa': '333333333333',
            'prod': '444444444444'
        }
        return f'''locals {{
  account_name = "{env}"
  account_id   = "{account_ids.get(env, '999999999999')}"
  role_arn     = "arn:aws:iam::{account_ids.get(env, '999999999999')}:role/terragrunt"
}}'''

    def generate_env_hcl(self, env: str) -> str:
        return f'''locals {{
  environment = "{env}"
  env_vars = {{
    environment = "{env}"
    name_prefix = "{env}"
  }}
}}'''

    def generate_region_hcl(self, region: str) -> str:
        return f'''locals {{
  aws_region = "{region}"
  region_vars = {{
    aws_region = "{region}"
    region_tag = "{region}"
  }}
}}'''

    def generate_terragrunt_hcl(self, module_name: str, relative_path: str, dependencies: List[str] = None) -> str:
        relative_deps = []
        if dependencies:
            current_path = Path(relative_path)
            for dep in dependencies:
                dep_path = Path(dep)
                try:
                    rel_path = os.path.relpath(dep_path, current_path.parent)
                    relative_deps.append(rel_path)
                except ValueError:
                    continue

        content = [
            'include "root" {',
            '  path = find_in_parent_folders()',
            '}',
            ''
        ]

        if dependencies and relative_deps:
            content.extend([
                'dependencies {',
                '  paths = [',
                *[f'    "../{dep}",' for dep in relative_deps],
                '  ]',
                '}',
                ''
            ])

        content.extend([
            'terraform {',
            f'  source = "git::git@github.com/example/terraform-modules.git//{module_name}?ref=v1.0.0"',
            '}',
            '',
            'locals {',
            '  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))',
            '  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))',
            '  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))',
            '}',
            '',
            'inputs = {',
            f'  name = "{module_name}"',
            '  environment = local.env_vars.locals.environment',
            '  region = local.region_vars.locals.aws_region',
            f'  tags = {{',
            f'    BusinessUnit = "{random.choice(self.business_units)}"',
            f'    ServiceCategory = "{random.choice(self.service_categories)}"',
            '    Environment = local.env_vars.locals.environment',
            '    ManagedBy = "terragrunt"',
            '  }',
            '}'
        ])

        return '\n'.join(content)

    def generate_structure(self, base_path: str, depth_complexity: int = 3) -> tuple:
        base_path = Path(base_path)
        base_path.mkdir(parents=True, exist_ok=True)
        total_files = 0
        
        # Generate root terragrunt.hcl
        with open(base_path / "terragrunt.hcl", "w") as f:
            f.write(generate_root_config())
        total_files += 1

        # For each region
        for region in self.regions[:depth_complexity]:
            region_path = base_path / region
            region_path.mkdir(parents=True, exist_ok=True)
            
            # Write region.hcl
            with open(region_path / "region.hcl", "w") as f:
                f.write(self.generate_region_hcl(region))
            total_files += 1

            # For each environment
            for env in self.environments[:depth_complexity]:
                env_path = region_path / env
                env_path.mkdir(parents=True, exist_ok=True)
                
                # Write account.hcl and env.hcl
                with open(env_path / "account.hcl", "w") as f:
                    f.write(self.generate_account_hcl(env))
                with open(env_path / "env.hcl", "w") as f:
                    f.write(self.generate_env_hcl(env))
                total_files += 2

                # For each business unit
                for bu in self.business_units[:depth_complexity]:
                    bu_path = env_path / bu
                    bu_path.mkdir(parents=True, exist_ok=True)

                    # For each service category
                    for sc in self.service_categories[:depth_complexity]:
                        sc_path = bu_path / sc
                        sc_path.mkdir(parents=True, exist_ok=True)

                        # Generate multiple services
                        for service_idx in range(depth_complexity):
                            service_name = f"service-{service_idx+1}"
                            service_path = sc_path / service_name
                            service_path.mkdir(parents=True, exist_ok=True)

                            # For each module type
                            for module_category, modules in self.module_types.items():
                                category_path = service_path / module_category
                                category_path.mkdir(parents=True, exist_ok=True)

                                # Generate multiple components
                                for _ in range(depth_complexity):
                                    component_name = f"{random.choice(modules)}-{random.randint(1, 999)}"
                                    component_path = category_path / component_name
                                    component_path.mkdir(parents=True, exist_ok=True)

                                    # Record this path for dependency generation
                                    relative_path = str(component_path.relative_to(base_path))
                                    self.dependency_gen.add_path(relative_path)

        # Generate dependencies after all paths are created
        for path in self.dependency_gen.all_paths:
            full_path = base_path / path
            dependencies = self.dependency_gen.generate_dependencies(path)
            
            # Write terragrunt.hcl with dependencies
            with open(full_path / "terragrunt.hcl", "w") as f:
                f.write(self.generate_terragrunt_hcl(
                    path.split('/')[-1],
                    str(full_path),
                    dependencies
                ))
            total_files += 1

        # Write dependency map for analysis
        with open(base_path / "dependency_map.json", "w") as f:
            json.dump(self.dependency_gen.dependency_map, f, indent=2)

        return (
            total_files,
            len(self.dependency_gen.all_paths),
            sum(len(deps) for deps in self.dependency_gen.dependency_map.values())
        )

def main():
    generator = TerragruntGenerator()
    base_path = "terragrunt-monorepo"
    
    # Adjust depth_complexity to control the size of the generated structure
    # Higher values create more files and deeper nesting
    total_files, total_nodes, total_edges = generator.generate_structure(
        base_path,
        depth_complexity=3  # Increase this for larger structures
    )
    
    print(f"""Generated Terragrunt Monorepo Statistics:
Base Path: {base_path}
Total Files: {total_files:,}
Total Components (Nodes): {total_nodes:,}
Total Dependencies (Edges): {total_edges:,}
Average Dependencies per Component: {total_edges/total_nodes:.2f}
""")

if __name__ == "__main__":
    main()
