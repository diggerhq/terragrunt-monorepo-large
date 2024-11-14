include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/storage/s3-895",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/monitoring/cloudwatch-79",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/application/api-gateway-847",
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/security/shield-109",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/compute/spot-fleet-387",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-782?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-782"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}