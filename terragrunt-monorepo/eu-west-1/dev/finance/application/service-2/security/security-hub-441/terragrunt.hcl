include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-1/storage/efs-989",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/security/iam-926",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/security/kms-137",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/monitoring/grafana-957",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-441?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-441"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}