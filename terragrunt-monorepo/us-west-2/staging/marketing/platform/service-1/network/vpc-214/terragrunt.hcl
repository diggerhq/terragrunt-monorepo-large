include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/data/service-2/monitoring/trace-collection-967",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/security/waf-121",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/network/nacl-3",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/compute/eks-301",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/network/vpn-188",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-214?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-214"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}