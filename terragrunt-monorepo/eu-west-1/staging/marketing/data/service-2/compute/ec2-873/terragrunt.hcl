include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/monitoring/log-aggregation-889",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/compute/spot-fleet-101",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/application/service-mesh-569",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/security/certificates-949",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/storage/fsx-509",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-873?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-873"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}