include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/storage/elasticache-804",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/compute/ec2-413",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/security/secrets-528",
    "../../../../../../../../us-east-1/dev/finance/application/service-1/network/transit-gateway-573",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-834?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-834"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}