include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-3/compute/ec2-715",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/monitoring/prometheus-714",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/application/service-mesh-960",
    "../../../../../../../../us-west-2/dev/finance/application/service-1/application/service-mesh-815",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-122?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-122"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}