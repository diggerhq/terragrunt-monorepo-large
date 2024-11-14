include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/application/service-1/compute/fargate-194",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/application/event-bus-352",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/application/event-bus-719",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/security/secrets-91",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/monitoring/grafana-778",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-910?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-910"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}