include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/storage/fsx-766",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/compute/fargate-802",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/network/direct-connect-11",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/security/secrets-177",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-232?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-232"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}