include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/compute/ecs-496",
    "../../../../../../../../us-west-2/dev/operations/data/service-2/security/certificates-440",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/compute/ec2-24",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/compute/lambda-981",
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/network/vpn-949",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-900?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-900"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}