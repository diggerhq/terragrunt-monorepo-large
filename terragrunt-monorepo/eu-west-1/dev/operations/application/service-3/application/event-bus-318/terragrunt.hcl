include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/data/service-2/compute/eks-818",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/network/vpn-156",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/monitoring/cloudwatch-136",
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/compute/batch-878",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-318?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-318"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}