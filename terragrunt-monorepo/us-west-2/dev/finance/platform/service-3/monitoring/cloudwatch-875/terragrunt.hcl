include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/security/certificates-167",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/security/shield-473",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/compute/lambda-984",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/storage/elasticache-361",
    "../../../../../../../../us-west-2/dev/operations/application/service-2/network/nacl-31",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-875?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-875"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}