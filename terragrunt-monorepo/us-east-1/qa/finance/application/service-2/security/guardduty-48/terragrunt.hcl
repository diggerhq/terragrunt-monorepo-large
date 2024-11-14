include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/compute/ec2-29",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/storage/fsx-648",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/compute/eks-43",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/monitoring/log-aggregation-540",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/monitoring/grafana-968",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-48?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-48"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}