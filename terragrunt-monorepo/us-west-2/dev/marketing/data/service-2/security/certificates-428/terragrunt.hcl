include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/storage/elasticache-804",
    "../../../../../../../../us-west-2/staging/finance/data/service-1/network/endpoint-577",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/network/direct-connect-489",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/security/certificates-852",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/compute/eks-36",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-428?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-428"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}