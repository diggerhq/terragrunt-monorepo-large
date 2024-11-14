include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-2/storage/dynamodb-355",
    "../../../../../../../../us-west-2/qa/operations/data/service-1/application/cache-layer-778",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/compute/spot-fleet-379",
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/compute/ec2-272",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-86?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-86"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}