include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/compute/eks-77",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/security/security-hub-870",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/compute/eks-350",
    "../../../../../../../../us-west-2/qa/operations/data/service-2/monitoring/alertmanager-856",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/monitoring/alertmanager-314",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-459?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-459"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}