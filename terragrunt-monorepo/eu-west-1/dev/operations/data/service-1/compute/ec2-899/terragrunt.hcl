include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/application/cache-layer-651",
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/application/api-gateway-748",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/security/iam-161",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/security/certificates-854",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/compute/batch-993",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-899?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-899"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}