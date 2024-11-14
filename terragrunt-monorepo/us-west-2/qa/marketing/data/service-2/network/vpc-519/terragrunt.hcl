include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/monitoring/prometheus-509",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/compute/spot-fleet-407",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/storage/efs-632",
    "../../../../../../../../us-west-2/dev/finance/data/service-3/application/cache-layer-659",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-519?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-519"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}