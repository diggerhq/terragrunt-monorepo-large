include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/application/event-bus-147",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/compute/fargate-944",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/storage/s3-701",
    "../../../../../../../../us-west-2/dev/finance/data/service-3/storage/redshift-200",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/security/waf-729",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-986?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-986"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}