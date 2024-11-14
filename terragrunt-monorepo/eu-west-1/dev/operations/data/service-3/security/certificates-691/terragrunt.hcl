include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-1/monitoring/trace-collection-538",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/compute/eks-606",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/compute/spot-fleet-8",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-691?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-691"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}