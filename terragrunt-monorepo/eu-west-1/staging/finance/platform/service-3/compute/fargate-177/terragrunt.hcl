include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/compute/spot-fleet-299",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/application/queue-649",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/storage/backup-468",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/application/load-balancer-567",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-177?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-177"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}