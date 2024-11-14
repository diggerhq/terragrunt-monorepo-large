include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/network/vpc-330",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/security/certificates-167",
    "../../../../../../../../us-west-2/qa/operations/data/service-2/monitoring/cloudwatch-76",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/monitoring/log-aggregation-440",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-455?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-455"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}