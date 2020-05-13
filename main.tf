terraform {
  required_version = ">= 0.12"
}

locals {
  tags = merge(var.tags, { "Name" = "${var.network_name}-ip" })
}

variable "packet_project_name" {
  description = "The project name"
  type        = string
  default     = "aws-registration-ci"
}

resource "packet_project" "this" {
  name = var.packet_project_name
}

resource "packet_reserved_ip_block" "test" {
  project_id = packet_project.this.id
  type       = "global_ipv4"
  quantity   = 1
}

module "registration" {
  source = "github.com/insight-icon/terraform-icon-registration.git?ref=master"

  skip_registration = var.skip_registration

  public_ip       = var.public_ip == "" ? join("", aws_eip.this.*.public_ip) : var.public_ip
  static_endpoint = var.details_endpoint
  network_name    = var.network_name

  keystore_path     = var.keystore_path
  keystore_password = var.keystore_password

  organization_name    = var.organization_name
  organization_country = var.organization_country
  organization_email   = var.organization_email
  organization_city    = var.organization_city
  organization_website = var.organization_website
}

