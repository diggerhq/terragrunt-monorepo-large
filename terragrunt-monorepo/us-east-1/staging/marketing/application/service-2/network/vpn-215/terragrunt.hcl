include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/compute/batch-336",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/network/endpoint-976",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/security/security-hub-194",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/security/certificates-324",
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/security/secrets-416",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-215?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-215"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}