include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-1/compute/eks-177",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/compute/fargate-706",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/compute/auto-scaling-335",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/monitoring/alertmanager-150",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-512?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-512"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}