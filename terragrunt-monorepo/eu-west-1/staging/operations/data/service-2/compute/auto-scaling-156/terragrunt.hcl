include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/network/nacl-938",
    "../../../../../../../../us-west-2/dev/operations/application/service-2/compute/spot-fleet-256",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/monitoring/alertmanager-357",
    "../../../../../../../../us-east-1/dev/operations/data/service-3/storage/backup-856",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-156?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-156"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}