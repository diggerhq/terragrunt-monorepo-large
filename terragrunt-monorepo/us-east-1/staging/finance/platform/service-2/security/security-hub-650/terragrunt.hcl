include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/application/service-2/security/iam-43",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/monitoring/log-aggregation-271",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/compute/ecs-514",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/network/endpoint-677",
    "../../../../../../../../us-west-2/dev/operations/application/service-1/storage/rds-325",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-650?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-650"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}