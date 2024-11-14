include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/network/nacl-882",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/monitoring/alertmanager-415",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/compute/ec2-797",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/compute/ec2-420",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/monitoring/prometheus-85",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-274?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-274"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}