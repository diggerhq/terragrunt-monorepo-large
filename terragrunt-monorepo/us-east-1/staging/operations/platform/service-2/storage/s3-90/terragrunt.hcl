include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/application/queue-897",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/compute/ecs-374",
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/monitoring/grafana-358",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/monitoring/grafana-784",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/network/vpn-569",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-90?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-90"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}