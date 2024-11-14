include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/compute/fargate-250",
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/storage/s3-957",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/security/shield-698",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/monitoring/grafana-968",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-897?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-897"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}