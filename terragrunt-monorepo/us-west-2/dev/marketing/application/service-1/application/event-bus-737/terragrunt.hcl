include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/security/shield-139",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/storage/elasticache-923",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/monitoring/trace-collection-750",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/compute/ecs-648",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-737?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-737"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}