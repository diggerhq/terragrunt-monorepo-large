include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/compute/ec2-647",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/compute/ec2-691",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/compute/fargate-644",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/security/shield-263",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-252?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-252"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}