include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/security/waf-316",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/storage/redshift-711",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/monitoring/log-aggregation-708",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/compute/fargate-814",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/compute/ec2-110",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-64?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-64"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}