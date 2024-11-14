include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/monitoring/trace-collection-898",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/compute/ecs-390",
    "../../../../../../../../us-west-2/dev/finance/application/service-3/storage/efs-567",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/network/vpc-208",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/storage/elasticache-10",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-740?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-740"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}