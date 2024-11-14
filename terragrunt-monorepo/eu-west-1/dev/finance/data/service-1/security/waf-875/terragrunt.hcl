include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/compute/lambda-500",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/monitoring/grafana-620",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/network/vpc-147",
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/storage/s3-461",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/storage/efs-795",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-875?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-875"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}