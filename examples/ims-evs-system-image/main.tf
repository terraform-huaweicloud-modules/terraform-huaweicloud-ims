resource "random_password" "this" {
  length           = 16
  special          = true
  min_numeric      = 1
  min_special      = 1
  min_lower        = 1
  min_upper        = 1
  override_special = "!#"
}

data "huaweicloud_availability_zones" "this" {}

module "vpc_network" {
  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-vpc?ref=v1.2.0"

  enterprise_project_id = var.vpc_enterprise_project_id
  availability_zone     = try(data.huaweicloud_availability_zones.this.names[0], "")

  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  subnets_configuration = var.subnets_configuration
  security_group_name   = var.security_group_name
}

module "ecs_instance" {
  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-ecs"

  enterprise_project_id = var.ecs_instance_enterprise_project_id
  availability_zone     = try(data.huaweicloud_availability_zones.this.names[0], "")

  instance_flavor_cpu_core_count      = var.instance_flavor_cpu_core_count
  instance_flavor_memory_size         = var.instance_flavor_memory_size
  instance_image_os_type              = var.instance_image_os_type
  instance_image_architecture         = var.instance_image_architecture
  instance_name                       = var.instance_name
  instance_admin_pass                 = random_password.this.result
  instance_security_group_ids         = [module.vpc_network.security_group_id]
  use_inside_data_disks_configuration = true
  instance_disks_configuration        = var.instance_disks_configuration

  instance_networks_configuration = try(module.vpc_network.subnet_ids[0], "") != "" ? [
    {
      uuid = try(module.vpc_network.subnet_ids[0], "")
    }
  ] : []
}

module "evs_volume" {
  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-evs/modules/evs-volume"

  volume_availability_zone = try(data.huaweicloud_availability_zones.this.names[0], "")

  volume_type        = var.volume_type
  volume_iops        = var.volume_iops
  volume_throughput  = var.volume_throughput
  volume_device_type = var.volume_device_type
  volume_name        = var.volume_name
  volume_description = var.volume_description
  volume_size        = var.volume_size
  volume_multiattach = var.volume_multiattach
}

resource "huaweicloud_compute_volume_attach" "this" {
  instance_id = module.ecs_instance.instance_id
  volume_id   = module.evs_volume.volume_id
}

module "ims_evs_system_image" {
  source = "../../modules/ims-system-image"

  is_ecs_system_image_create = false

  evs_system_image_name                  = var.evs_system_image_name
  evs_system_image_volume_id             = module.evs_volume.volume_id
  evs_system_image_os_version            = var.evs_system_image_os_version
  evs_system_image_type                  = var.evs_system_image_type
  evs_system_image_description           = var.evs_system_image_description
  evs_system_image_max_ram               = var.evs_system_image_max_ram
  evs_system_image_min_ram               = var.evs_system_image_min_ram
  evs_system_image_tags                  = var.evs_system_image_tags
  evs_system_image_enterprise_project_id = var.evs_system_image_enterprise_project_id

  depends_on = [huaweicloud_compute_volume_attach.this]
}
