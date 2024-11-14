include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-2/compute/lambda-318",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/storage/backup-737",
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/application/api-gateway-52",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/security/certificates-46",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-795?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-795"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}