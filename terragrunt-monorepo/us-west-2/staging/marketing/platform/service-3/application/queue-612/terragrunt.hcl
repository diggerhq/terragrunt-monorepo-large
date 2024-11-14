include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/monitoring/prometheus-7",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/network/nacl-339",
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/security/waf-393",
    "../../../../../../../../us-west-2/staging/finance/data/service-1/security/security-hub-836",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-612?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-612"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}