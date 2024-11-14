include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-1/compute/auto-scaling-675",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/application/service-mesh-281",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/monitoring/cloudwatch-410",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-955?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-955"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}