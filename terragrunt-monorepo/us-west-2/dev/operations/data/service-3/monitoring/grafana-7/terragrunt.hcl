include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/network/vpn-417",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/compute/eks-580",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/monitoring/cloudwatch-835",
    "../../../../../../../../us-west-2/dev/operations/application/service-2/security/waf-604",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/storage/elasticache-860",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-7?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-7"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}