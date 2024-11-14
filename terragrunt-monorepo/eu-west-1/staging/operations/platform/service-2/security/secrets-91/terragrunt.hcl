include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/security/waf-984",
    "../../../../../../../../us-west-2/qa/finance/data/service-1/monitoring/log-aggregation-836",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/network/transit-gateway-372",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/compute/lambda-292",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/network/nacl-938",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-91?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-91"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}