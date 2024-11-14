include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/compute/lambda-979",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/compute/ec2-897",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/security/waf-72",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/security/waf-986",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/application/cache-layer-74",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-320?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-320"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}