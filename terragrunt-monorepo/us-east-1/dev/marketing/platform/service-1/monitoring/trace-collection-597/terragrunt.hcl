include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/monitoring/prometheus-998",
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/compute/fargate-102",
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/security/certificates-243",
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/security/shield-458",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-597?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-597"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}