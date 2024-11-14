include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/network/vpn-448",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/monitoring/prometheus-749",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/monitoring/alertmanager-748",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/application/api-gateway-12",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/compute/auto-scaling-399",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-35?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-35"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}