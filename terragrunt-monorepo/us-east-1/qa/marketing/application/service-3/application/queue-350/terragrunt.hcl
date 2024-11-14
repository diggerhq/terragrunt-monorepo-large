include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/compute/ecs-926",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/monitoring/prometheus-359",
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/application/queue-254",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/network/endpoint-47",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/network/direct-connect-434",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-350?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-350"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}