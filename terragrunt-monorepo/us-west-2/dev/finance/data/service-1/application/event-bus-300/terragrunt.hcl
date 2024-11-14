include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/monitoring/prometheus-937",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/compute/eks-52",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/network/subnet-440",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/security/security-hub-293",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-300?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-300"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}