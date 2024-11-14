include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-2/compute/spot-fleet-43",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/monitoring/cloudwatch-661",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/compute/batch-181",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/monitoring/alertmanager-863",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-730?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-730"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}