## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_token | The personal access token for a third-party source control system for an Amplify app. The personal access token is used to create a webhook and a read-only deploy key. The token is not stored. | `string` | `null` | no |
| amplify\_service\_role\_enabled | Whether to enable the IAM Service Role for Amplify or not | `bool` | `false` | no |
| amplify\_service\_role\_name | Name of the IAM Service Role attached to AWS Amplify | `string` | `"AWSAmplifyExecutionRole"` | no |
| app\_name | Name of the AWS Amplify application | `string` | n/a | yes |
| auto\_branch\_creation\_config | n/a | <pre>list(object({<br>    basic_auth_credentials         = string<br>    build_spec                     = string<br>    enable_auto_build              = string<br>    enable_basic_auth              = bool<br>    enable_performance_mode        = bool<br>    enable_pull_request_preview    = bool<br>    environment_variables          = map(string)<br>    framework                      = string<br>    pull_request_environment_name  = string<br>    stage                          = string<br>  }))</pre> | `[]` | no |
| auto\_branch\_creation\_patterns | The automated branch creation glob patterns for an Amplify app | `list` | `null` | no |
| backend\_environment\_name | The name for the backend environment | `string` | `null` | no |
| basic\_auth\_credentials | The credentials for basic authorization for an Amplify app | `string` | `null` | no |
| branch\_basic\_auth\_credentials | The basic authorization credentials for the branch | `string` | `null` | no |
| branch\_description | Description of the Branch that will be tied to the AWS Amplify | `string` | `null` | no |
| branch\_display\_name | The display name for a branch. This is used as the default domain prefix | `string` | `null` | no |
| branch\_enable\_auto\_build | n/a | `bool` | `false` | no |
| branch\_enable\_basic\_auth | n/a | `bool` | `false` | no |
| branch\_enable\_notification | n/a | `bool` | `false` | no |
| branch\_enable\_performance\_mode | n/a | `bool` | `false` | no |
| branch\_enable\_pull\_request\_preview | n/a | `bool` | `false` | no |
| branch\_environment\_variables | The environment variables for the branch | `map(string)` | `null` | no |
| branch\_framework | The framework for the branch | `string` | `null` | no |
| branch\_name | Name of the Branch that will be tied to the AWS Amplify | `string` | `null` | no |
| branch\_pull\_request\_environment\_name | The Amplify environment name for the pull request | `string` | `null` | no |
| branch\_stage | Describes the current stage for the branch. Valid values: PRODUCTION, BETA, DEVELOPMENT, EXPERIMENTAL, PULL\_REQUEST | `string` | `null` | no |
| build\_spec | Your build spec file contents. If not provided then it will use the amplify.yml at the root of your project / branch | `string` | `null` | no |
| custom\_rules | The custom rules to apply to the Amplify App. | <pre>list(object({<br>    source    = string # Required<br>    target    = string # Required<br>    status    = any    # Use null if not passing<br>    condition = any    # Use null if not passing<br>  }))</pre> | `[]` | no |
| deployment\_artifacts | The name of deployment artifacts | `string` | `null` | no |
| description | The description for the Amplify app | `string` | `null` | no |
| domain\_names | List of maps for domain names association | `any` | `null` | no |
| enable\_backend\_environment | Whether to create the backend environment or not | `bool` | `false` | no |
| enable\_basic\_auth | Enables basic authorization for an Amplify app. This will apply to all branches that are part of this app. | `bool` | `false` | no |
| enable\_branch\_auto\_build | Enables the auto building of branches for an Amplify app | `bool` | `false` | no |
| enable\_branch\_auto\_deletion | Automatically disconnects a branch in the Amplify Console when you delete a branch from your Git repository | `bool` | `false` | no |
| enable\_domain\_association | Wheter to create a domain association or not | `bool` | `false` | no |
| enable\_webhook | Wheter to create a webhook or not | `string` | `false` | no |
| environment | Name of the environment | `string` | n/a | yes |
| environment\_variables | Environment variables | `map(string)` | `null` | no |
| oauth\_token | The OAuth token for a third-party source control system for an Amplify app. The OAuth token is used to create a webhook and a read-only deploy key. The OAuth token is not stored. | `string` | `null` | no |
| platform | The platform or framework for an Amplify app. Valid values: WEB | `string` | `null` | no |
| repository\_url | URL of the source repository | `string` | `null` | no |
| stack\_name | The AWS CloudFormation stack name of a backend environment | `string` | `null` | no |
| subdomains | The custom rules to apply to the Amplify App. | <pre>list(object({<br>    branch_name = string<br>    prefix      = string<br>  }))</pre> | `[]` | no |
| tags | n/a | `map(string)` | `{}` | no |
| wait\_for\_verification | If enabled, the resource will wait for the domain association status to change to PENDING\_DEPLOYMENT or AVAILABLE. Setting this to false will skip the process | `bool` | `true` | no |
| webhook\_description | Description of the webhook | `string` | `null` | no |

## Outputs

No output.