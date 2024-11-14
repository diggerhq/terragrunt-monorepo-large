include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/monitoring/cloudwatch-340",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/application/api-gateway-851",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/compute/lambda-157",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/network/direct-connect-44",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-465?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-465"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}