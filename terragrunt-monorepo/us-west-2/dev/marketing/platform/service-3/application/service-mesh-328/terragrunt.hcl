include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/security/certificates-922",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/compute/lambda-505",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/application/cache-layer-855",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/network/nacl-496",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/application/cache-layer-897",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-328?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-328"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}