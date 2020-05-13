provider "packet" {
  //  auth_token = var.packet_auth_token
  version = "~>2.3"
}

variable "keystore_path" {
  default = ""
}

variable "keystore_password" {
  default = "testing1."
}

locals {
  keystore_path = var.keystore_path == "" ? "${path.cwd}/../../test/fixtures/keystore/testnet" : var.keystore_path
}

module "defaults" {
  source = "../.."

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


  keystore_password = var.keystore_password
  keystore_path     = local.keystore_path

  details_endpoint = "https://raw.githubusercontent.com/insight-icon/terraform-icon-packet-registration/master/test/fixtures/details.json"
}
