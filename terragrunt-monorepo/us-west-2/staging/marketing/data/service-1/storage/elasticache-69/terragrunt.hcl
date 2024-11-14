include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/monitoring/log-aggregation-237",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/compute/ec2-302",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/monitoring/trace-collection-439",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-69?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-69"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}