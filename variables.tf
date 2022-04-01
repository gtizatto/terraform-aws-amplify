#------------------------------------------------------------------------------
# IAM Service rotation_turn_length_seconds
#------------------------------------------------------------------------------
variable "amplify_service_role_enabled" {
  default     = false
  type        = bool
  description = "Whether to enable the IAM Service Role for Amplify or not"
}

variable "amplify_service_role_name" {
  type        = string
  description = "Name of the IAM Service Role attached to AWS Amplify"
  default     = "AWSAmplifyExecutionRole"
}

#------------------------------------------------------------------------------
# AWS Amplify App
#------------------------------------------------------------------------------
variable "app_name" {
  type        = string
  description = "Name of the AWS Amplify application"
}

variable "environment" {
  type        = string
  description = "Name of the environment"
}

variable "description" {
  type        = string
  description = "The description for the Amplify app"
  default     = null
}

variable "repository_url" {
  type        = string
  description = "URL of the source repository"
  default     = null
}

variable "platform" {
  type        = string
  description = "The platform or framework for an Amplify app. Valid values: WEB"
  default     = null
}

variable "build_spec" {
  type        = string
  description = "Your build spec file contents. If not provided then it will use the amplify.yml at the root of your project / branch"
  default     = null
}

variable "enable_branch_auto_build" {
  type        = bool
  description = "Enables the auto building of branches for an Amplify app"
  default     = false
}

variable "enable_branch_auto_deletion"{
  type        = bool
  description = "Automatically disconnects a branch in the Amplify Console when you delete a branch from your Git repository"
  default     = false
}

variable "auto_branch_creation_patterns" {
  type        = list
  description = "The automated branch creation glob patterns for an Amplify app"
  default     = null
}

variable "auto_branch_creation_config" {
  default = []
  type    = list(object({
    basic_auth_credentials         = string
    build_spec                     = string
    enable_auto_build              = string
    enable_basic_auth              = bool
    enable_performance_mode        = bool
    enable_pull_request_preview    = bool
    environment_variables          = map(string)
    framework                      = string
    pull_request_environment_name  = string
    stage                          = string
  }))
}

variable "custom_rules" {
  default = []
  type    = list(object({
    source    = string # Required
    target    = string # Required
    status    = any    # Use null if not passing
    condition = any    # Use null if not passing
  }))
  description = "The custom rules to apply to the Amplify App."
}

variable "access_token" {
  type        = string
  description = "The personal access token for a third-party source control system for an Amplify app. The personal access token is used to create a webhook and a read-only deploy key. The token is not stored."
  default     = null
}

variable "oauth_token" {
  type        = string
  description = "The OAuth token for a third-party source control system for an Amplify app. The OAuth token is used to create a webhook and a read-only deploy key. The OAuth token is not stored."
  default     = null
}

variable "enable_basic_auth" {
  type        = bool
  description = "Enables basic authorization for an Amplify app. This will apply to all branches that are part of this app."
  default     = false
}

variable "basic_auth_credentials" {
  type        = string
  description = "The credentials for basic authorization for an Amplify app"
  default     = null
}

variable "environment_variables" {
  type        = map(string)
  description = "Environment variables"
  default     = null
}

variable "tags" {
  type        = map(string)
  default     = {}
}


#------------------------------------------------------------------------------
# AWS Amplify Branch
#------------------------------------------------------------------------------
variable "branch_name" {
  type        = string
  description = "Name of the Branch that will be tied to the AWS Amplify"
  default     = null
}

variable "branch_description" {
  type        = string
  description = "Description of the Branch that will be tied to the AWS Amplify"
  default     = null
}

variable "branch_display_name" {
  type        = string
  description = "The display name for a branch. This is used as the default domain prefix"
  default     = null
}

variable "branch_enable_auto_build" {
  type        = bool
  description = ""
  default     = false
}
variable "branch_enable_basic_auth" {
  type        = bool
  description = ""
  default     = false
}
variable "branch_enable_notification" {
  type        = bool
  description = ""
  default     = false
}
variable "branch_enable_performance_mode" {
  type        = bool
  description = ""
  default     = false
}
variable "branch_enable_pull_request_preview" {
  type        = bool
  description = ""
  default     = false
}

variable "branch_pull_request_environment_name" {
  type        = string
  description =  "The Amplify environment name for the pull request"
  default     = null
}

variable "branch_basic_auth_credentials" {
  type        = string
  description =  "The basic authorization credentials for the branch"
  default     = null
}

variable "branch_framework" {
  type        = string
  description =  "The framework for the branch"
  default     = null
}
variable "branch_stage" {
  type        = string
  description = "Describes the current stage for the branch. Valid values: PRODUCTION, BETA, DEVELOPMENT, EXPERIMENTAL, PULL_REQUEST"
  default     = null
}
variable "branch_environment_variables" {
  type        = map(string)
  description = "The environment variables for the branch"
  default     = null
}


#------------------------------------------------------------------------------
# AWS Amplify Backend Environment
#------------------------------------------------------------------------------
variable "backend_environment_name" {
  type        = string
  description = "The name for the backend environment"
  default     = null
}

variable "enable_backend_environment" {
  type        = bool
  description = "Whether to create the backend environment or not"
  default     = false
}

variable "deployment_artifacts" {
  type        = string
  description = "The name of deployment artifacts"
  default     = null
}

variable "stack_name" {
  type        = string
  description = "The AWS CloudFormation stack name of a backend environment"
  default     = null
}


#------------------------------------------------------------------------------
# AWS Amplify Domain Association
#------------------------------------------------------------------------------
variable "enable_domain_association" {
  type        = bool
  description = "Wheter to create a domain association or not"
  default     = false
}

variable "domain_names" {
  type        = any
  description = "List of maps for domain names association"
  default     = null
}

variable "subdomains" {
  type    = list(object({
    branch_name = string
    prefix      = string
  }))
  description = "The custom rules to apply to the Amplify App."
  default = []
}

variable "wait_for_verification" {
  type        = bool
  description = "If enabled, the resource will wait for the domain association status to change to PENDING_DEPLOYMENT or AVAILABLE. Setting this to false will skip the process"
  default     = true
}

#------------------------------------------------------------------------------
# AWS Amplify Webhook
#------------------------------------------------------------------------------
variable "enable_webhook" {
  type        = string
  description = "Wheter to create a webhook or not"
  default     = false
}

variable "webhook_description" {
  type        = string
  description = "Description of the webhook"
  default     = null
}
