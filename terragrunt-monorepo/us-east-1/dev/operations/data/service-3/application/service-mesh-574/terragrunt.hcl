include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/application/api-gateway-548",
    "../../../../../../../../us-west-2/qa/marketing/data/service-1/storage/dynamodb-760",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/compute/spot-fleet-993",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/application/service-mesh-782",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-574?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-574"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}