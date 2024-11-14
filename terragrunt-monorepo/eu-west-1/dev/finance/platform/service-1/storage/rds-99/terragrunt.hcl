include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-2/security/certificates-229",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/monitoring/prometheus-67",
    "../../../../../../../../us-west-2/qa/operations/application/service-2/monitoring/trace-collection-529",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/compute/ecs-537",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-99?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-99"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}