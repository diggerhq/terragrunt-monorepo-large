include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-3/network/subnet-551",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/security/kms-290",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/monitoring/cloudwatch-941",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/compute/fargate-412",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-277?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-277"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}