include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/security/certificates-332",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/monitoring/cloudwatch-884",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/security/shield-877",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/monitoring/alertmanager-729",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/application/queue-172",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-172?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-172"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}