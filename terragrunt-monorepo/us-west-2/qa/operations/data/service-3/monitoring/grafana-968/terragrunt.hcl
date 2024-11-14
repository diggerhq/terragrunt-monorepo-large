include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/security/guardduty-543",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/compute/eks-965",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/storage/backup-234",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/compute/lambda-721",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/network/vpc-4",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-968?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-968"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}