include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-3/compute/eks-165",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/monitoring/prometheus-394",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/compute/ecs-169",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-28?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-28"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}