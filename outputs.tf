output "packet_project_name" {
  value = var.packet_project_name
}

output "public_ip" {
  value = module.registration.public_ip
}

output "details_endpoint" {
  value = module.registration.details_endpoint
}

output "details_content" {
  value = module.registration.details_content
}

output "registration_json" {
  value = module.registration.registration_json
}

output "network_name" {
  value = var.network_name
}

output "registration_command" {
  value = module.registration.registration_command
}

output "update_registration_command" {
  value = module.registration.update_registration_command
}