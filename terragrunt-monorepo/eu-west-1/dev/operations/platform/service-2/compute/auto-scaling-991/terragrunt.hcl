include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-2/compute/eks-129",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/application/load-balancer-625",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/monitoring/cloudwatch-923",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/application/api-gateway-955",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/application/load-balancer-524",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-991?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-991"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}