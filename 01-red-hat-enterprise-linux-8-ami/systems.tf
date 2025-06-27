variable "baseline_ami_systems" {
  description = ""

  type = list(object({
    /* Required Parameters */
    region            = string
    subnet            = string
    hostname          = string
    private_ip        = string
    availability_zone = string

    /* Optional Parameters */
    ami               = optional(string)
    instance_type     = optional(string, "m6i.large")

    root_block_device = optional(
      object({
        volume_type           = optional(string, "gp3")
        volume_size           = optional(string, "100")
        delete_on_termination = optional(bool, true)
        tags = optional(
          object({
            name = optional(string)
          })
        )
      })
    )

    lifecycle = optional(
      object({
        ignore_changes = optional(list(string))
      })
    )

    tags = optional(
      object({
        OS          = optional(string, "Red Hat Enterprise Linux 8")
        Name        = optional(string)
        Backup      = optional(bool, false)
        Function    = optional(string, "AMI Builder")
        Terraform   = optional(bool, true)
        Environment = string
      })
    )
  })
}
