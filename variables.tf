# variables.tf

variable "project_name"{
  description = "setting up a mongodb instance in us-east-1 and a peer in asia"
  default     = "newser"
}

variable "project_domain"{
  default = "newser.rdig.co"
}

variable "regionA"{
  description = "the region for A"
  default     = "us-east-1"
}

variable "zoneA"{
  description = "the zone for A"
  default     = "b"
}

variable "instance_type_A"{
  description = "instance in us-east"
  default     = "t2.medium"
}

variable "ami_A"{
  default = "ami-07ea394feb05a3fc3"
}

variable "ami_B"{
  default = "ami-0f8c65cdcc35d0a72"
}

variable "regionB"{
  description = "the region for B"
  default     = "ap-southeast-1"
}

variable "zoneB"{
  description = "the zone for B"
  default     = "b"
}

variable "instance_type_B"{
  description = "instance in ap-southeast"
  default     = "t2.micro"
}

variable "public_key" {
  description = "deployer_key"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDpNC6t3KeivMpUnRZz00YPuJIaXvx/cFFLlfbTaGp8K6s799TRG4a+HL5mnohix+gfxyYLycsvCrRZBCqKgtMkAaC3Wj/PbZs68xRdenUhu0nMEHoZbQgsvkvGBiLUfC95RqDzuTqmBycLMpR+ztSkqxdWNFlNd1p+7uoF8lHeZnnzwExJ/cNkqfpclb/TRSZAaQ6zLTFK6sP+OVxigHK6T2NOhEFANbalSYwW9NrILHVBhF8M9gbVqaAizkCHw0eMdKhvicYs9k7r77z2UuXWPbsFnddRnpwxSx4bOw4JYL2+4UYKccaBYjeNnFbZ8UtGynoWgubMy7yMg52GsYqp jon@rivingtondigital.com"
}

variable "queue_name" {
  default = "post_rescan.fifo"
}

variable "ssm_variable"{
  default = "post_rescan_queue"
}


