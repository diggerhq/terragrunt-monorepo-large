include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/compute/ecs-617",
    "../../../../../../../../us-east-1/dev/finance/application/service-3/monitoring/cloudwatch-128",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/security/certificates-606",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/network/route-table-659",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/storage/backup-620",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-563?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-563"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}