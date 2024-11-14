include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/monitoring/grafana-900",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/security/secrets-71",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/monitoring/log-aggregation-500",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/compute/eks-936",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-158?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-158"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}