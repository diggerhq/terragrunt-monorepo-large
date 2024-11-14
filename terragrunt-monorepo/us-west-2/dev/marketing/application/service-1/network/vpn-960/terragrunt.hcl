include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-2/application/load-balancer-937",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/storage/redshift-541",
    "../../../../../../../../us-west-2/dev/operations/data/service-2/security/guardduty-758",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/monitoring/cloudwatch-596",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-960?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-960"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}