include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/security/certificates-606",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/network/vpc-892",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/monitoring/log-aggregation-709",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/security/shield-383",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/network/endpoint-982",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-79?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-79"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}