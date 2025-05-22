locals = {
  database_hosts = {
    "ttchq-wsus01b" = {
      /* Required Parameters */
      region            = "west"
      subnet            = 
      hostname          = "ttchq-wsus01b"
      private_ip        = "10.69.128.50"
      availability_zone = "b"
  
      /* Required Parameters */
      ami               = var.aws_ami.static.WindowsServer2019
      instance_type     = 
      security_groups   = [""]
  
      # Operating System Volume
      root_block_device = {
        volume_type = 
        volume_size = 
        delete_on_termination = TRUE
        tags = {
          name = ""
        }
      }
  
      lifecycle = {
        ignore_changes = ""
      }
  
      tags = {
        OS          =
        Name        =  
        Backup      =  
        Function    = "Windows Server Update Service (WSUS)"
        Terraform   = TRUE
        Environment = 
        CLAP_ON     = 
        CLAP_OFF    =
      }
    }
  }
}
