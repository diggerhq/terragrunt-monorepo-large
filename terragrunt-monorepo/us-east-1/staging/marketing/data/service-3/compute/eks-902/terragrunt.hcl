include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-1/storage/backup-46",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/network/transit-gateway-332",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/security/certificates-332",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/compute/lambda-292",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-902?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-902"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}