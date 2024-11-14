include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/application/service-3/application/cache-layer-471",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/compute/auto-scaling-849",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/network/transit-gateway-416",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/security/certificates-949",
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/storage/s3-957",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-368?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-368"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}