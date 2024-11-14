include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-2/application/queue-353",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/storage/fsx-988",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/security/secrets-951",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/monitoring/prometheus-704",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/monitoring/trace-collection-466",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-54?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-54"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}