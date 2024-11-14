include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/monitoring/grafana-933",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/monitoring/cloudwatch-661",
    "../../../../../../../../us-west-2/staging/finance/data/service-3/application/api-gateway-751",
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/security/iam-307",
    "../../../../../../../../us-west-2/qa/finance/data/service-1/application/api-gateway-178",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-405?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-405"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}