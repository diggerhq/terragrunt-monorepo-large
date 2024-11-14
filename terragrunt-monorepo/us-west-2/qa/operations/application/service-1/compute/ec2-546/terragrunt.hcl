include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/monitoring/trace-collection-273",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/monitoring/alertmanager-596",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/storage/elasticache-295",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/compute/ec2-400",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-546?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-546"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}