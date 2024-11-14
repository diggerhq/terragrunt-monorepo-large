include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/monitoring/grafana-970",
    "../../../../../../../../us-east-1/qa/finance/application/service-1/security/kms-779",
    "../../../../../../../../us-west-2/qa/operations/application/service-2/application/event-bus-610",
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/compute/ecs-597",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-714?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-714"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}