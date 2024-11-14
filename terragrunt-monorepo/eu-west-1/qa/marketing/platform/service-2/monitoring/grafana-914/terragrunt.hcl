include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-1/monitoring/cloudwatch-556",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/security/iam-43",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/compute/auto-scaling-373",
    "../../../../../../../../us-west-2/staging/operations/data/service-2/security/certificates-866",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-914?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-914"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}