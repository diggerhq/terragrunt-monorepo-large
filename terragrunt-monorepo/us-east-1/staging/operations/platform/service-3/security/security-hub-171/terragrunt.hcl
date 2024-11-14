include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/network/vpc-405",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/network/direct-connect-448",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/storage/elasticache-230",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/security/certificates-63",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-171?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-171"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}