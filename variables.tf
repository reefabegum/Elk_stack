variable "vpc_name" {
  type        = string
  description = "The name of VPC."
}

variable "vpc_cidr" {
  
  description = "The VPC cidr."
}

variable "cidr_public" {
  
  description = "The VPC Public cidr."

}

variable "cidr_private" {
  
  description = "The VPC private cidr."

}


variable "cidr_private1" {
  
  description = "The VPC Private1 cidr."

}
variable "cidr_private2" {
  
  description = "The VPC Private2 cidr."

}
variable "cidr_private3" {
  
  description = "The VPC Private3 cidr."

}
variable "elasticsearch_ami_id" {
    description = "This is my ami id for ElasticSearch"
    type        = string
}


variable "logstash_ami_id" {
    description = "This is my ami id for Logstash"
    type        = string
}
variable "kibana_ami_id" {
    description = "This is my ami id for Kibana"
    type        = string
}