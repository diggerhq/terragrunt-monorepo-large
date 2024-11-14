include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/storage/efs-531",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/compute/ec2-134",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/network/subnet-799",
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/monitoring/grafana-677",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-1/storage/rds-789",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-155?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-155"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}