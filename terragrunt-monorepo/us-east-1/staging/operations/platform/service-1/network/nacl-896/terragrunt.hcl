include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-3/application/load-balancer-252",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/storage/rds-902",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/application/load-balancer-723",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/storage/backup-687",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-896?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-896"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}