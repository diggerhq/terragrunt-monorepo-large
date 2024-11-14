include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/compute/batch-533",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/compute/ec2-621",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/monitoring/grafana-483",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/security/guardduty-18",
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/storage/redshift-736",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-261?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-261"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}