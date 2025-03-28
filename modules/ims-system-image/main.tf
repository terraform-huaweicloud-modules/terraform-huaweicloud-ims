resource "huaweicloud_ims_ecs_system_image" "this" {
  count = var.is_ecs_system_image_create ? 1 : 0

  name                  = var.ecs_system_image_name
  instance_id           = var.ecs_system_image_instance_id
  description           = var.ecs_system_image_description
  max_ram               = var.ecs_system_image_max_ram
  min_ram               = var.ecs_system_image_min_ram
  tags                  = var.ecs_system_image_tags
  enterprise_project_id = var.ecs_system_image_enterprise_project_id
}
