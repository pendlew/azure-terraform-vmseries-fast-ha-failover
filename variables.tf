
# ---------------------------------------------------------------------------------------------------------------------
#   Resource Group
# ---------------------------------------------------------------------------------------------------------------------

variable "create_resource_group" {
  description = "Do you want the Terraform to Create the Resource Group (true) or use an Existing Resource Group (false)"
  default     = false
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  default     = "azure-fast-ha5"
}

# ---------------------------------------------------------------------------------------------------------------------
#   Resource Location
# ---------------------------------------------------------------------------------------------------------------------

variable "resource_location" {
  description = "Location of all resources to be created"
  default     = "westeurope"
}

# ---------------------------------------------------------------------------------------------------------------------
#   Virtual Network
# ---------------------------------------------------------------------------------------------------------------------

variable "create_virtual_network" {
  description = "Terraform to create Virtual Network (true) or use an existing Virtual Networks (false)"
  default     = false
}

variable "virtual_network_name" {
  description = "Name of the Azure Virtual Network"
  default     = "vnet"
}

variable "virtual_network_cidr" {
  description = "Virtual Networks CIDR Block"
  default     = "10.9.0.0/24"
}

# ---------------------------------------------------------------------------------------------------------------------
#   Subnets
# ---------------------------------------------------------------------------------------------------------------------

variable "create_virtual_network_subnets" {
  description = "Terraform to create Virtual Network subnets (true) or use existing subnets (false)"
  default     = false
}

variable "virtual_network_subnets" {
  description = "Subnet Map for Creation"
  default = {
    management = {
      address_prefixes = ["10.9.0.0/28"]
    },
    ha2 = {
      address_prefixes = ["10.9.0.16/28"]
    },
    private = {
      address_prefixes = ["10.9.0.32/28"]
    },
    public = {
      address_prefixes = ["10.9.0.48/28"]
    },
    loadbalancer = {
      address_prefixes = ["10.9.0.64/28"]
    }
  }
}

# Ensure you keep them names vmseries0 and vmseries1 or you will have to change reference in the TF files.
# 
variable "vmseries" {
  description = "Definition of the VM-Series deployments"
  default = {
    # use vmseries0 or vmservies1 here
    vmseries0 = {
      admin_username    = "pandemo"
      admin_password    = "Pal0Alto!"
      instance_size     = "Standard_DS4_v2"
      # License options "byol", "bundle1", "bundle2"
      license           = "byol"
      version           = "10.0.4"
      management_ip     = "10.9.0.5"
      ha2_ip            = "10.9.0.20"
      private_ip        = "10.9.0.37"
      public_ip         = "10.9.0.52"
      availability_zone = 1
      # If not licensing authcode is needed leave this set to a value of a space (ie " ")
      authcodes = " "
    }
  }
}


variable "inbound_tcp_ports" {
  default = [22, 80]
}

variable "inbound_udp_ports" {
  default = [500, 4500]
}
