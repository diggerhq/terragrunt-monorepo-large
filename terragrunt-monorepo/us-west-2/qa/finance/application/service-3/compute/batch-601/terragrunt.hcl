include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/storage/s3-892",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/application/cache-layer-693",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/compute/ec2-809",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-601?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-601"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}