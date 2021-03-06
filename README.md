# terraform-icon-packet-registration

## Features

This module helps with registering a node on the ICON Blockchain. It does two main things.

- Creates an elastic IP that will be your main IP that your node will use to run and applies a number of tags on the
resource so it can be queried to be attached to instances later
- Runs `preptools` to register the node or update the info

**Make sure you have 2000 ICX registration fee in your wallet for mainnet and you have testnet tokens for testnet**

See also related repos:

- [github.com/insight-icon/terraform-icon-registration](https://github.com/insight-icon/terraform-icon-registration)
- [github.com/insight-icon/terraform-icon-aws-registration](https://github.com/insight-icon/terraform-icon-aws-registration)
- [github.com/insight-icon/terraform-icon-gcp-registration](https://github.com/insight-icon/terraform-icon-gcp-registration)

> FYI - This module doesn't post static content
> Still needs testing for the details.json 

## Using this module

Fill out the appropriate values in `terraform.tfvars.example` then move to `terraform.tfvars` if running directly.

Really this module should be used from a scaffolding like `terragrunt` like in (terragrunt-aws-icon)[https://github.com/insight-infrastructure/terragrunt-aws-icon]

## Terraform Versions

For Terraform v0.12.0+

## Usage

```hcl
module "this" {
    source = "github.com/insight-infrastructure/terraform-aws-icon-registration.git?ref=v0.1.0"
    network_name = "testnet"

    organization_name    = "Insight-CI"
    organization_country = "USA"
    # This needs to be three letter country code per https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3
    organization_email = "hunter@gmail.com"
    # Needs to be real email
    organization_city = "A city"
    # No qualifiers
    organization_website = "https://google.com"
    # Needs to begin in https / http - can be google...

    # Leave these blank and you will be prompted
    # keystore_password = var.keystore_password
    keystore_path     = var.keystore_path

    logo_svg = var.logo_svg
}
```

## Examples

- [defaults](https://github.com/robc-io/terraform-aws-icon-registration/tree/master/examples/defaults)

## Known  Issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| packet | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| details\_endpoint | The endpoint to find details.json | `string` | n/a | yes |
| keystore\_password | The keystore password | `string` | n/a | yes |
| keystore\_path | the path to your keystore | `string` | n/a | yes |
| network\_name | mainnet or testnet - Don't mess this up!!!!!!!! | `string` | `"mainnet"` | no |
| organization\_city | No qualifiers | `string` | `""` | no |
| organization\_country | This needs to be three letter country code per https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3 | `string` | `""` | no |
| organization\_email | Needs to be real email | `string` | `""` | no |
| organization\_name | Any string - your team name | `string` | `""` | no |
| organization\_website | Needs to begin in https / http - can be google... | `string` | `""` | no |
| packet\_project\_name | The project name - defaults to org name | `string` | `""` | no |
| public\_ip | Optional if you are registering an IP from a different network - only creates details content, leave blank and insert cloud provdier to create ip | `string` | `""` | no |
| skip\_registration | Boolean to skip executing registration command | `bool` | `false` | no |
| tags | Additional tags to include | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| details\_content | n/a |
| details\_endpoint | n/a |
| network\_name | n/a |
| packet\_project\_name | n/a |
| public\_ip | n/a |
| registration\_command | n/a |
| registration\_json | n/a |
| update\_registration\_command | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing
This module has been packaged with terratest tests

To run them:

1. Install Go
2. Run `make test-init` from the root of this repo
3. Run `make test` again from root

## Authors

Module managed by [robc-io](github.com/robc-io)

## Credits

- [Anton Babenko](https://github.com/antonbabenko)

## License

Apache 2 Licensed. See LICENSE for full details.