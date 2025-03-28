output "ecs_system_image_id" {
  description = "The ID of the image"
  value       = module.ims_ecs_system_image.ecs_system_image_id
}

output "ecs_system_image_status" {
  description = "The status of the image"
  value       = module.ims_ecs_system_image.ecs_system_image_status
}
