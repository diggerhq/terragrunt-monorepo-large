include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/compute/ec2-704",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/storage/efs-548",
    "../../../../../../../../us-west-2/staging/operations/application/service-3/storage/s3-21",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/application/api-gateway-871",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/compute/eks-177",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-308?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-308"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}