include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-3/network/direct-connect-887",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/monitoring/prometheus-576",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/compute/eks-905",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/network/endpoint-698",
    "../../../../../../../../us-east-1/dev/operations/application/service-3/network/subnet-288",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-417?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-417"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}