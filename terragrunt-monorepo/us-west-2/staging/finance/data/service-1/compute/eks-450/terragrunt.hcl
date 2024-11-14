include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/application/event-bus-803",
    "../../../../../../../../us-west-2/qa/finance/data/service-1/application/api-gateway-457",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/security/secrets-48",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/compute/batch-802",
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/network/vpc-97",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-450?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-450"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}