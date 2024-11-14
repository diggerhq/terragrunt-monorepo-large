include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/application/service-3/compute/auto-scaling-123",
    "../../../../../../../../us-west-2/dev/operations/data/service-2/network/transit-gateway-872",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/compute/auto-scaling-632",
    "../../../../../../../../us-west-2/qa/operations/application/service-3/compute/eks-577",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/security/secrets-350",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-995?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-995"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}