include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-2/compute/eks-772",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/compute/fargate-144",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/monitoring/grafana-500",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/security/shield-122",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/network/endpoint-818",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-483?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-483"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}