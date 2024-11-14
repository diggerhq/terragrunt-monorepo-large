include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/monitoring/alertmanager-748",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/security/certificates-407",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/security/shield-683",
    "../../../../../../../../us-east-1/dev/operations/application/service-3/network/nacl-769",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-654?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-654"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}