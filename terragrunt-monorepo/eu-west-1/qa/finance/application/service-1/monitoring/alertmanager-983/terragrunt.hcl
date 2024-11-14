include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/security/waf-182",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/storage/elasticache-45",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/compute/ecs-834",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/compute/ec2-691",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/storage/s3-715",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-983?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-983"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}