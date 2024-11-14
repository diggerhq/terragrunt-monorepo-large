include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/security/secrets-74",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/compute/eks-353",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/security/shield-533",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/monitoring/grafana-517",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/application/queue-771",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-633?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-633"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}