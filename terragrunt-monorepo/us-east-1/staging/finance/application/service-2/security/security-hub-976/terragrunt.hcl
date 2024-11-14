include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/storage/s3-746",
    "../../../../../../../../us-west-2/staging/finance/data/service-1/compute/spot-fleet-18",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/compute/ec2-634",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/network/endpoint-409",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/application/api-gateway-436",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-976?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-976"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}