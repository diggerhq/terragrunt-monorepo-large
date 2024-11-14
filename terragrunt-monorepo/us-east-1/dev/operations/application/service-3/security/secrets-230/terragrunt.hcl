include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/network/vpc-262",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/storage/elasticache-734",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/storage/s3-134",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/network/subnet-958",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/storage/backup-46",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-230?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-230"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}