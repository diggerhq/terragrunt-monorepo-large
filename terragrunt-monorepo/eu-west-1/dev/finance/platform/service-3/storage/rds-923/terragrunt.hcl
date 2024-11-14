include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/compute/ec2-29",
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/monitoring/prometheus-945",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/security/kms-611",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/compute/lambda-500",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/network/endpoint-708",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-923?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-923"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}