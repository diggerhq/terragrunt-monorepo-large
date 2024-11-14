include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/compute/ecs-883",
    "../../../../../../../../us-west-2/staging/operations/data/service-2/security/kms-377",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/compute/ec2-41",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/security/security-hub-350",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-964?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-964"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}