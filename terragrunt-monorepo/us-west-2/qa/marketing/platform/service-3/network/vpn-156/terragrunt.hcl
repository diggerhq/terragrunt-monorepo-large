include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-3/storage/elasticache-696",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/compute/fargate-453",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/security/shield-340",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/security/certificates-703",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-156?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-156"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}