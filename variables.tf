variable "packet_project_name" {
  description = "The project name - defaults to org name"
  type        = string
  default     = ""
}

variable "skip_registration" {
  description = "Boolean to skip executing registration command"
  type        = bool
  default     = false
}

variable "public_ip" {
  description = "Optional if you are registering an IP from a different network - only creates details content, leave blank and insert cloud provdier to create ip"
  type        = string
  default     = ""
}

variable "keystore_path" {
  description = "the path to your keystore"
  type        = string
}

variable "keystore_password" {
  description = "The keystore password"
  type        = string
}

variable "details_endpoint" {
  description = "The endpoint to find details.json"
  type        = string
}

variable "tags" {
  description = "Additional tags to include"
  type        = map(string)
  default     = {}
}

variable "network_name" {
  description = "mainnet or testnet - Don't mess this up!!!!!!!!"
  type        = string
  default     = "mainnet"
}

##############
# Registration
##############
variable "organization_name" {
  description = "Any string - your team name"
  type        = string
  default     = ""
}
variable "organization_country" {
  description = "This needs to be three letter country code per https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3"
  type        = string
  default     = ""
}
variable "organization_email" {
  description = "Needs to be real email"
  type        = string
  default     = ""
}
variable "organization_city" {
  description = "No qualifiers"
  type        = string
  default     = ""
}
variable "organization_website" {
  description = "Needs to begin in https / http - can be google..."
  type        = string
  default     = ""
}

