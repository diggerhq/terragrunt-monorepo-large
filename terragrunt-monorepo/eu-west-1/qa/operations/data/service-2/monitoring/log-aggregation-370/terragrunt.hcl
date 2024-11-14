include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/compute/eks-606",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/network/endpoint-47",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/application/cache-layer-681",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/application/queue-105",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/security/secrets-782",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-370?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-370"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}