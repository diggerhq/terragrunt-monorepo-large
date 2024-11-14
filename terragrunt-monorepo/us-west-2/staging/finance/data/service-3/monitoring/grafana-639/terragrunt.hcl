include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/compute/eks-339",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/application/queue-679",
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/monitoring/grafana-677",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-639?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-639"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}