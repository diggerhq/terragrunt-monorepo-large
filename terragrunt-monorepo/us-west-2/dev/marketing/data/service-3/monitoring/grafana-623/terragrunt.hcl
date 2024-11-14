include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/security/kms-978",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/compute/lambda-532",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/compute/ec2-226",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/security/guardduty-887",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/security/secrets-329",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-623?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-623"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}