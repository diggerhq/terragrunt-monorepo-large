include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-2/security/kms-377",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/compute/eks-688",
    "../../../../../../../../us-west-2/qa/operations/application/service-2/storage/dynamodb-903",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/monitoring/prometheus-86",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/storage/s3-903",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-630?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-630"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}