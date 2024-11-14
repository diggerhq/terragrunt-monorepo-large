include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/storage/dynamodb-8",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/monitoring/trace-collection-913",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/compute/spot-fleet-209",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/security/security-hub-315",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/storage/elasticache-385",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-632?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-632"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}