include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-3/security/guardduty-5",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/network/transit-gateway-150",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/compute/ec2-442",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/application/event-bus-407",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/compute/ec2-336",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-86?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-86"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}