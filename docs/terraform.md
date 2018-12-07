
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucket |  | string | `Bucket name to store user data script` | no |
| flavor | Flavor depends of OS and init system | string | `debian-systemd` | no |
| name |  | string | - | yes |
| namespace |  | string | `global` | no |
| path | Path to store user data script in bucket | string | `/` | no |
| stage |  | string | `default` | no |
| user_data | User data scripts content | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| policy_arn |  |
| user_data |  |

