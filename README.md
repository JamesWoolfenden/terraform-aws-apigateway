[![Slalom][logo]](https://slalom.com)

# terraform-aws-apigateway

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-apigateway/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-apigateway)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-apigateway.svg)](https://github.com/JamesWoolfenden/terraform-aws-apigateway/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

---

Terraform module to create an apigateway, each gateway will have different resources hanging off it so its more of an example than a module. It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include this repository as a module in your existing terraform code:

```hcl
module "apigateway" {
  source                 = "jameswoolfenden/apigateway/aws"
  common_tags            = var.common_tags
}
```

## IAM Permissions

Policies used to create and destroy this resource:

```json
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "apigateway:DELETE",
          "apigateway:GET",
          "apigateway:PATCH",
          "apigateway:POST",
          "apigateway:PUT",
          "apigateway:SetWebACL",
          "apigateway:UpdateRestApiPolicy"
        ],
        "Effect": "Allow",
        "Resource": "*"
      },
      {
        "Action": [
          "lambda:AddPermission",
          "lambda:GetAlias",
          "lambda:GetFunction",
          "lambda:GetFunctionConfiguration",
          "lambda:GetPolicy",
          "lambda:ListAliases",
          "lambda:ListFunctions",
          "lambda:ListLayers",
          "lambda:ListTags",
          "lambda:RemovePermission"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  }
```

## Detailed Notes

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed\_range | n/a | `list` | n/a | yes |
| authorization | What Auth to use for the method | `string` | `"AWS_IAM"` | no |
| common\_tags | This is to help you add tags to your cloud objects | `map` | n/a | yes |
| function\_name | n/a | `string` | n/a | yes |
| name | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| url | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Related Projects

Check out these related projects.

- [terraform-aws-codecommit](https://github.com/jameswoolfenden/terraform-aws-apigateway) - Storing ones code

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-aws-apigateway/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-aws-apigateway/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2020 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden

[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-apigateway&url=https://github.com/jameswoolfenden/terraform-aws-apigateway
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-apigateway&url=https://github.com/jameswoolfenden/terraform-aws-apigateway
[share_reddit]: https://reddit.com/submit/?url=https://github.com/jameswoolfenden/terraform-aws-apigateway
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/jameswoolfenden/terraform-aws-apigateway
[share_email]: mailto:?subject=terraform-aws-apigateway&body=https://github.com/jameswoolfenden/terraform-aws-apigateway
