include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/application/service-3/monitoring/trace-collection-252",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/monitoring/prometheus-576",
    "../../../../../../../../us-west-2/dev/operations/application/service-2/application/event-bus-30",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/network/nacl-938",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/monitoring/trace-collection-622",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-54?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-54"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}