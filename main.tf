locals {
  app_name = "${var.environment}-${var.app_name}"
}

resource "aws_iam_role" "this" {
  count = var.amplify_service_role_enabled ? 1 : 0

  name                = "${local.app_name}-amplify-role"
  assume_role_policy  = join("", data.aws_iam_policy_document.assume_role.*.json)
  managed_policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  tags                = var.tags
}


resource "aws_iam_role_policy" "this" {
  count = var.amplify_service_role_enabled ? 1 : 0

  name = "${local.app_name}-amplify-policy"
  role = aws_iam_role.this[0].id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:*",
          "codecommit:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}


resource "aws_amplify_app" "this" {
  name        = local.app_name
  description = var.description
  repository  = var.repository_url
  platform    = var.platform

  build_spec = var.build_spec != null ? var.build_spec : null

  enable_branch_auto_build      = var.enable_branch_auto_build
  enable_branch_auto_deletion   = var.enable_branch_auto_deletion
  auto_branch_creation_patterns = var.auto_branch_creation_patterns

  dynamic "auto_branch_creation_config" {
    for_each = var.auto_branch_creation_config
    iterator = config

    content {
      basic_auth_credentials        = config.value.basic_auth_credentials
      build_spec                    = config.value.build_spec
      enable_auto_build             = config.value.enable_auto_build
      enable_basic_auth             = config.value.enable_basic_auth
      enable_performance_mode       = config.value.enable_performance_mode
      enable_pull_request_preview   = config.value.enable_pull_request_preview
      environment_variables         = config.value.environment_variables
      framework                     = config.value.framework
      pull_request_environment_name = config.value.pull_request_environment_name
      stage                         = config.value.stage
    }
  }

  dynamic "custom_rule" {
    for_each = var.custom_rules
    iterator = rule

    content {
      source    = rule.value.source
      target    = rule.value.target
      status    = rule.value.status
      condition = lookup(rule.value, "condition", null)
    }
  }

  access_token  = var.access_token
  oauth_token   = var.oauth_token

  enable_basic_auth      = var.enable_basic_auth
  basic_auth_credentials = var.enable_basic_auth ? var.basic_auth_credentials : null

  environment_variables = var.environment_variables
  iam_service_role_arn  = var.amplify_service_role_enabled ? aws_iam_role.this[0].arn : null

  tags = var.tags
}



resource "aws_amplify_branch" "this" {
  app_id       = aws_amplify_app.this.id
  branch_name  = var.branch_name
  description  = var.branch_description
  display_name = var.branch_display_name

  enable_auto_build           = var.branch_enable_auto_build
  enable_notification         = var.branch_enable_notification
  enable_performance_mode     = var.branch_enable_performance_mode
  enable_pull_request_preview = var.branch_enable_pull_request_preview

  pull_request_environment_name = var.branch_pull_request_environment_name

  backend_environment_arn = var.enable_backend_environment ? aws_amplify_backend_environment.this[0].arn : null

  framework = var.branch_framework
  stage     = var.branch_stage

  enable_basic_auth      = var.branch_enable_basic_auth
  basic_auth_credentials = var.branch_enable_basic_auth ? var.branch_basic_auth_credentials : null



  environment_variables = var.branch_environment_variables
}


resource "aws_amplify_backend_environment" "this" {
  count = var.enable_backend_environment ? 1 : 0

  app_id           = aws_amplify_app.this.id
  environment_name = var.backend_environment_name

  deployment_artifacts = var.deployment_artifacts
  stack_name           = var.stack_name
}


resource "aws_amplify_domain_association" "this" {
  for_each = {for n in var.domain_names : n.domain_name => n}

  app_id      = aws_amplify_app.this.id
  domain_name = each.value.domain_name

  dynamic "sub_domain" {
    for_each = each.value.subdomains

    content {
      branch_name = sub_domain.value.branch_name
      prefix      = sub_domain.value.prefix
    }
  }

  wait_for_verification = var.wait_for_verification
}


resource "aws_amplify_webhook" "this" {
  count = var.enable_webhook ? 1 : 0

  app_id      = aws_amplify_app.this.id
  branch_name = aws_amplify_branch.this.branch_name
  description = var.webhook_description
}
