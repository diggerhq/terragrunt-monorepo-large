include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/data/service-1/security/security-hub-860",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/application/queue-334",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/monitoring/prometheus-869",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/monitoring/trace-collection-334",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-215?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-215"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}