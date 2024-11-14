include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-3/monitoring/trace-collection-865",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/compute/eks-165",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/monitoring/prometheus-486",
    "../../../../../../../../us-west-2/qa/operations/application/service-2/network/vpn-629",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-955?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-955"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}