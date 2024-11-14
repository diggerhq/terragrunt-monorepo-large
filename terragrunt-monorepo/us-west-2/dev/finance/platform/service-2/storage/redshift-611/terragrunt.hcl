include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/network/transit-gateway-442",
    "../../../../../../../../us-west-2/dev/operations/application/service-2/security/certificates-818",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/security/certificates-858",
    "../../../../../../../../us-east-1/dev/operations/application/service-3/network/nacl-769",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-611?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-611"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}