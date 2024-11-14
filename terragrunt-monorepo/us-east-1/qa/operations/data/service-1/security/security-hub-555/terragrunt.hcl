include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/monitoring/alertmanager-377",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/monitoring/cloudwatch-358",
    "../../../../../../../../us-east-1/dev/finance/application/service-1/security/guardduty-675",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/storage/dynamodb-232",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/compute/eks-580",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-555?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-555"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}