include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/network/route-table-796",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/security/security-hub-428",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/compute/batch-533",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/security/security-hub-623",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/compute/ecs-666",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-622?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-622"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}