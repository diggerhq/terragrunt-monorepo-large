include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/storage/s3-966",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/network/vpn-493",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/compute/ecs-656",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/security/secrets-528",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-900?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-900"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}