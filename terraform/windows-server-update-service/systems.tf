variable "all_systems" {
  description = ""

  type = list(
    object({
      /* Required Parameters */
      region                 = string
      hostname               = string
      private_ip             = string
      availability_zone      = string
      vpc_security_group_ids = list(string)

      /* Optional Parameters */
      ami                    = optional(string)
      instance_type          = optional(string, "m6i.large")
      get_password_data      = optional(bool, true)

      root_block_device = optional(
        object({
          volume_type           = optional(string, "gp3") 
          volume_size           = optional(string, "100")
          delete_on_termination = optional(bool, true)
          iops                  = optional(string)
          throughput            = optional(string)
          tags                  = optional(object)
        })
      )

      ebs_block_device = optional(
        list(
          object({
            volume_type           = optional(string, "gp3") 
            volume_size           = optional(string, "100")
            delete_on_termination = optional(bool, false)
            device_name           = optional(string, "/dev/xvdf")
            tags                  = optional(object)
          })
        )
      )

      network_interfaces = list(
        object({
          #subnet_ip              = Calculated automatically from parent object
          #region                 = Calculated automatically from parent object
          description             = optional(string)
          interface_type          = optional(string)
          private_ips             = list(string)
          security_groups         = optional(list(string))
          tags                    = optional(object)
        })
      )

      tags = optional(
        object({
          OS                      = optional(string, "Red Hat Enterprise Linux 8")
          #Name                   = Calculated automatically from parent object
          Backup                  = optional(bool, false)
          Function                = optional(string, "AMI Builder")
          Terraform               = optional(bool, True)
          #Environment            = Calculated automatically from parent object
        })
      )
    })
  )
}
