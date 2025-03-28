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
# Configurations of the IMS ECS system image resource
######################################################################

variable "is_ecs_system_image_create" {
  type        = bool
  description = "Controls whether the IMS ECS system image should be created"
  default     = true
}

variable "ecs_system_image_name" {
  type        = string
  description = "The name of the image"
}

variable "ecs_system_image_description" {
  type        = string
  description = "The description of the image"
}

variable "ecs_system_image_max_ram" {
  type        = number
  description = "The maximum memory of the image, in MB unit"
}

variable "ecs_system_image_min_ram" {
  type        = number
  description = "The minimum memory of the image, in MB unit"
}

variable "ecs_system_image_tags" {
  type        = map(string)
  description = "The key/value pairs to associate with the image"
}

variable "ecs_system_image_enterprise_project_id" {
  type        = string
  description = "The enterprise project ID of the image. For enterprise users, if omitted, default enterprise project will be used"
}
