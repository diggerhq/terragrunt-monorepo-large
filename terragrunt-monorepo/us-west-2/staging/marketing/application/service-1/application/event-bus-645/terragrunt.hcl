include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/data/service-2/compute/eks-818",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/monitoring/cloudwatch-208",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/security/secrets-171",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-645?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-645"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}