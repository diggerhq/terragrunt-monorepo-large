include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/data/service-3/monitoring/cloudwatch-441",
    "../../../../../../../../us-west-2/dev/operations/application/service-1/application/queue-877",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/network/subnet-774",
    "../../../../../../../../us-east-1/dev/finance/data/service-2/application/cache-layer-361",
    "../../../../../../../../us-east-1/staging/operations/application/service-2/compute/eks-939",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-368?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-368"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}