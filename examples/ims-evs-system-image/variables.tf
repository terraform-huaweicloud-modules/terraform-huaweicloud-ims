######################################################################
# Configurations of the VPC resource and related resources
######################################################################

variable "vpc_enterprise_project_id" {
  type        = string
  description = "The enterprise project ID of the vpc. For enterprise users, if omitted, default enterprise project will be used"
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC to which the ECS instance belongs"
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block of the VPC to which the ECS instance belongs"
}

variable "subnets_configuration" {
  type = list(object({
    name = string
    cidr = string
  }))

  description = "The configuration for the subnets to which the ECS instance belongs"
}

variable "security_group_name" {
  type        = string
  description = "The name of the security group to which the ECS instance belongs"
}

######################################################################
# Configurations of ECS resource and related resources
######################################################################

variable "ecs_instance_enterprise_project_id" {
  type        = string
  description = "The enterprise project ID of the ECS instance. For enterprise users, if omitted, default enterprise project will be used"
}

variable "instance_flavor_cpu_core_count" {
  type        = number
  description = "The CPU core number of the ECS instance flavor to be queried"
}

variable "instance_flavor_memory_size" {
  type        = number
  description = "The memory size of the ECS instance flavor to be queried"
}

variable "instance_image_os_type" {
  type        = string
  description = "The OS type of the IMS image to be queried that the ECS instance used"
}

variable "instance_image_architecture" {
  type        = string
  description = "The architecture of the IMS image to be queried that the ECS instance used"
}

variable "instance_name" {
  type        = string
  description = "The name of the ECS instance"
}

variable "instance_disks_configuration" {
  type = list(object({
    is_system_disk = bool
    name           = optional(string, "")
    type           = string
    size           = number
  }))

  description = "The disks configuration to attach to the ECS instance"
}

######################################################################
# Configurations of EVS volume
######################################################################
variable "volume_type" {
  type        = string
  description = "The EVS volume type"
}

variable "volume_iops" {
  type        = number
  description = "The IOPS(Input/Output Operations Per Second) for the EVS volume"
}

variable "volume_throughput" {
  type        = number
  description = "The throughput for the EVS volume"
}

variable "volume_device_type" {
  type        = string
  description = "The device type for the EVS volume"
}

variable "volume_name" {
  type        = string
  description = "The EVS volume name"
}

variable "volume_description" {
  type        = string
  description = "The EVS volume description"
}

variable "volume_size" {
  type        = number
  description = "The EVS volume size, in GB"
}

variable "volume_multiattach" {
  type        = bool
  description = "Whether the EVS volume is shareable"
}

######################################################################
# Configurations of the IMS EVS system image resource
######################################################################
variable "evs_system_image_name" {
  type        = string
  description = "The name of the image"
}

variable "evs_system_image_os_version" {
  type        = string
  description = "The operating system version of the image"
}

variable "evs_system_image_type" {
  type        = string
  description = "The image type"
}

variable "evs_system_image_description" {
  type        = string
  description = "The description of the image"
}

variable "evs_system_image_max_ram" {
  type        = number
  description = "The maximum memory of the image, in MB unit"
}

variable "evs_system_image_min_ram" {
  type        = number
  description = "The minimum memory of the image, in MB unit"
}

variable "evs_system_image_tags" {
  type        = map(string)
  description = "The key/value pairs to associate with the image"
}

variable "evs_system_image_enterprise_project_id" {
  type        = string
  description = "The enterprise project ID of the image. For enterprise users, if omitted, default enterprise project will be used"
}
