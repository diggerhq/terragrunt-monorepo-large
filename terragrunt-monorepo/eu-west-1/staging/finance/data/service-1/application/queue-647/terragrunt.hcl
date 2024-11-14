include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/compute/auto-scaling-365",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/network/vpc-489",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/compute/fargate-795",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/storage/backup-711",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/network/vpn-432",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-647?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-647"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}