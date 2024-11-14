include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/compute/fargate-302",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/compute/fargate-93",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/monitoring/trace-collection-363",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/compute/spot-fleet-875",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/security/secrets-270",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-978?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-978"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}