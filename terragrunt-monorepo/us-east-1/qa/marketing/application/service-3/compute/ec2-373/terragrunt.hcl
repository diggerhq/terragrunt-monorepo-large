include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/storage/efs-370",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/application/queue-105",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/compute/spot-fleet-379",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/application/event-bus-334",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/storage/backup-654",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-373?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-373"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}