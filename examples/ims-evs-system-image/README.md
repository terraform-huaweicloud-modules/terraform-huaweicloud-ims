# IMS ECS system image example

Configuration in this directory creates an IMS EVS system image.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan -var-file=variables.json
$ terraform apply -var-file=variables.json
```

Run `terraform destroy -var-file=variables.json` when you don't need these resources.

## Requirements

| Name                 | Version   |
|----------------------|-----------|
| Terraform            | >= 1.3.0  |
| Huaweicloud Provider | >= 1.73.0 |

## Modules

<!-- markdownlint-disable MD013 -->
| Name             | Source                                                                                                  | Version |
|------------------|---------------------------------------------------------------------------------------------------------|---------|
| vpc_network      | [terraform-huaweicloud-vpc](https://github.com/terraform-huaweicloud-modules/terraform-huaweicloud-vpc) | v1.2.0  |
| ecs_instance     | [terraform-huaweicloud-ecs](https://github.com/terraform-huaweicloud-modules/terraform-huaweicloud-ecs) | N/A     |
| evs_volume       | [terraform-huaweicloud-evs](https://github.com/terraform-huaweicloud-modules/terraform-huaweicloud-evs) | N/A     |
| ims_system_image | [../../modules/ims-system-image](../../modules/ims-system-image)                                        | N/A     |
<!-- markdownlint-enable MD013 -->

## Resources

| Name                                     | Type        |
|------------------------------------------|-------------|
| random_password.this                     | resource    |
| huaweicloud_compute_volume_attach.this   | resource    |
| data.huaweicloud_availability_zones.this | data source |

## Inputs

<!-- markdownlint-disable MD013 -->
| Name                                   | Description                                                                                                              | Value                                                                                                  |
|----------------------------------------|--------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| vpc_enterprise_project_id              | The enterprise project ID of the vpc. For enterprise users, if omitted, default enterprise project will be used          | `0`                                                                                                    |
| vpc_name                               | The name of the VPC to which the ECS instance belongs                                                                    | `"vpc-test-module"`                                                                                    |
| vpc_cidr                               | The CIDR block of the VPC to which the ECS instance belongs                                                              | `"192.168.0.0/16"`                                                                                     |
| subnets_configuration                  | The configuration for the subnets to which the ECS instance belongs                                                      | <pre>[<br>  {<br>    name = "vpc-subnet-test-module",<br>    cidr = "192.168.0.0/24"<br>  }<br>]</pre> |
| security_group_name                    | The name of the security group to which the ECS instance belongs                                                         | `"security_group-test-module"`                                                                         |
| ecs_instance_enterprise_project_id     | The enterprise project ID of the ECS instance. For enterprise users, if omitted, default enterprise project will be used | `0`                                                                                                    |
| instance_flavor_cpu_core_count         | The CPU core number of the ECS instance flavor to be queried                                                             | `4`                                                                                                    |
| instance_flavor_memory_size            | The memory size of the ECS instance flavor to be queried                                                                 | `8`                                                                                                    |
| instance_image_os_type                 | The OS type of the IMS image to be queried that the ECS instance used                                                    | `"CentOS"`                                                                                             |
| instance_image_architecture            | The architecture of the IMS image to be queried that the ECS instance used                                               | `"x86"`                                                                                                |
| instance_name                          | The name of the ECS instance                                                                                             | `"ecs-test-module"`                                                                                    |
| instance_disks_configuration           | The disks configuration to attach to the ECS instance                                                                    | <pre>[<br>  {<br>    is_system_disk = true,<br>    type = "SSD",<br>    size = 200<br>  }<br>]</pre>   |
| volume_type                            | The EVS volume type                                                                                                      | `"GPSSD2"`                                                                                             |
| volume_iops                            | The IOPS(Input/Output Operations Per Second) for the EVS volume                                                          | `3000`                                                                                                 |
| volume_throughput                      | The throughput for the EVS volume                                                                                        | `125`                                                                                                  |
| volume_device_type                     | The device type for the EVS volume                                                                                       | `"VBD"`                                                                                                |
| volume_name                            | The EVS volume name                                                                                                      | `"test-volume-name"`                                                                                   |
| volume_description                     | The EVS volume description                                                                                               | `"test description"`                                                                                   |
| volume_size                            | The EVS volume size, in GB                                                                                               | `20`                                                                                                   |
| volume_multiattach                     | Whether the EVS volume is shareable                                                                                      | `false`                                                                                                |
| evs_system_image_name                  | The name of the image                                                                                                    | `"evs-image-test-module"`                                                                              |
| evs_system_image_os_version            | The operating system version of the image                                                                                | `"Ubuntu 19.04 server 64bit"`                                                                          |
| evs_system_image_type                  | The image type                                                                                                           | `"ECS"`                                                                                                |
| evs_system_image_description           | The description of the image                                                                                             | `"description test"`                                                                                   |
| evs_system_image_max_ram               | The maximum memory of the image, in MB unit                                                                              | `1024`                                                                                                 |
| evs_system_image_min_ram               | The minimum memory of the image, in MB unit                                                                              | `1024`                                                                                                 |
| evs_system_image_tags                  | The key/value pairs to associate with the image                                                                          | <pre>{<br>  foo = "bar"<br>  key = "value"<br>}</pre>                                                  |
| evs_system_image_enterprise_project_id | The enterprise project ID of the image. For enterprise users, if omitted, default enterprise project will be used        | `0`                                                                                                    |
<!-- markdownlint-enable MD013 -->

## Outputs

| Name                    | Description             |
|-------------------------|-------------------------|
| evs_system_image_id     | The ID of the image     |
| evs_system_image_status | The status of the image |
