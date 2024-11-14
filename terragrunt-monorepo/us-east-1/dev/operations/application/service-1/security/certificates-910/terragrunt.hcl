include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-1/application/queue-877",
    "../../../../../../../../us-east-1/staging/operations/data/service-1/storage/fsx-105",
    "../../../../../../../../us-west-2/dev/operations/data/service-2/network/subnet-731",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/monitoring/cloudwatch-678",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/storage/elasticache-385",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-910?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-910"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}