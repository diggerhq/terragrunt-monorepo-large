include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/storage/efs-634",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/compute/eks-843",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/network/vpn-156",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/network/endpoint-234",
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/monitoring/trace-collection-310",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-94?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-94"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}