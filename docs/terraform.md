
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucket |  | string | `Bucket name to store user data script` | no |
| flavor | Flavor depends of OS and init system | string | `debian-systemd` | no |
| name | Name  (e.g. `app` or `cluster`) | string | - | yes |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | - | yes |
| path | Path to store user data script in bucket | string | `/` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| user_data | User data scripts content | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| policy_arn | User data script iam policy that should be executed on startup |
| user_data | User data script that should be executed on startup |

