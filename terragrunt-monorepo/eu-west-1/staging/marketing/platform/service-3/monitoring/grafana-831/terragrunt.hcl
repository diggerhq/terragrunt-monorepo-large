include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/compute/ec2-336",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/security/iam-760",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/storage/elasticache-647",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-1/network/direct-connect-484",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/network/vpc-177",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-831?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-831"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}