include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/application/service-3/storage/efs-841",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/monitoring/prometheus-163",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/network/transit-gateway-489",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/monitoring/log-aggregation-629",
    "../../../../../../../../us-east-1/qa/finance/application/service-1/compute/ec2-667",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-577?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-577"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}