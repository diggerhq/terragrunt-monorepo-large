include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/application/service-2/security/certificates-271",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/monitoring/log-aggregation-689",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/compute/ec2-704",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/monitoring/trace-collection-566",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-996?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-996"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}