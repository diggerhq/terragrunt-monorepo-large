include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-2/monitoring/trace-collection-657",
    "../../../../../../../../us-west-2/qa/marketing/application/service-3/security/certificates-429",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/storage/elasticache-734",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/compute/fargate-360",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-957?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-957"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}