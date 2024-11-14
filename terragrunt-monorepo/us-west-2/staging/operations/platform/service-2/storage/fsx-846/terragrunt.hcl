include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/security/certificates-675",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/monitoring/cloudwatch-128",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/compute/spot-fleet-318",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/application/service-mesh-784",
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/monitoring/prometheus-118",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-846?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-846"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}