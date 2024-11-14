include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/network/nacl-72",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/compute/batch-81",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/compute/eks-556",
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/security/iam-218",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/application/queue-281",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-459?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-459"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}