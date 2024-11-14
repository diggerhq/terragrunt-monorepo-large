include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/monitoring/grafana-780",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/storage/dynamodb-303",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/compute/ec2-209",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/application/cache-layer-32",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-323?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-323"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}