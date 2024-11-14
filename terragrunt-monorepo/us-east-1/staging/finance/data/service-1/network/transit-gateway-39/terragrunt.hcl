include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/compute/ecs-469",
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/security/iam-385",
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/monitoring/grafana-662",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/compute/batch-258",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-39?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-39"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}