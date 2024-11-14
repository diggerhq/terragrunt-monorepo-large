include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-1/security/shield-558",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/security/waf-565",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/monitoring/prometheus-632",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/compute/fargate-710",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/compute/ec2-643",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-264?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-264"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}