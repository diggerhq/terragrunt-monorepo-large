include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/monitoring/grafana-529",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/security/certificates-276",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/application/service-mesh-423",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/storage/rds-926",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-126?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-126"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}