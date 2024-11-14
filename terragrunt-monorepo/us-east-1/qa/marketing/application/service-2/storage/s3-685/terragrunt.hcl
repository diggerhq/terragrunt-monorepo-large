include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-1/monitoring/grafana-674",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/monitoring/cloudwatch-884",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/network/vpn-265",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/compute/eks-818",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-685?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-685"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}