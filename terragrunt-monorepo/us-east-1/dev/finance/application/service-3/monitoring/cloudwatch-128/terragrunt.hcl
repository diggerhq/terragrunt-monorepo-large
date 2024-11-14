include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/compute/ec2-809",
    "../../../../../../../../us-east-1/qa/finance/application/service-1/security/certificates-773",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/monitoring/log-aggregation-112",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-128?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-128"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}