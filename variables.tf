# variables.tf

variable "project_name"{
  description = "setting up a mongodb instance in us-east-1 and a peer in asia"
  default     = "home"
}

variable "project_domain"{
  default = "home.rdig.co"
}

variable "instance_type"{
  description = "instance in us-east"
  default     = "t2.medium"
}

variable "ami"{
  default = "ami-07ea394feb05a3fc3"
}

variable "public_key" {
  description = "deployer_key"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDpNC6t3KeivMpUnRZz00YPuJIaXvx/cFFLlfbTaGp8K6s799TRG4a+HL5mnohix+gfxyYLycsvCrRZBCqKgtMkAaC3Wj/PbZs68xRdenUhu0nMEHoZbQgsvkvGBiLUfC95RqDzuTqmBycLMpR+ztSkqxdWNFlNd1p+7uoF8lHeZnnzwExJ/cNkqfpclb/TRSZAaQ6zLTFK6sP+OVxigHK6T2NOhEFANbalSYwW9NrILHVBhF8M9gbVqaAizkCHw0eMdKhvicYs9k7r77z2UuXWPbsFnddRnpwxSx4bOw4JYL2+4UYKccaBYjeNnFbZ8UtGynoWgubMy7yMg52GsYqp jon@rivingtondigital.com"
}

variable "ssm_variable"{
  default = "/rdig/general/mapbox"
}


