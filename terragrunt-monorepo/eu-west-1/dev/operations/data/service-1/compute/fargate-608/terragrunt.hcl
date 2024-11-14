include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/network/endpoint-982",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/security/iam-522",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/monitoring/log-aggregation-11",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/compute/eks-54",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/monitoring/prometheus-303",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-608?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-608"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}