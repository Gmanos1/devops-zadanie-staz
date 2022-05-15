variable "gke_num_nodes" {
  type    = number
  default = 2
}

variable "gke_machine_type" {
  type    = string
  default = "e2-medium"
}

variable "project_name" {
    type = string
    default = "zadanie-na-staz"
}

variable "zone_name" {
    type = string
    default = "us-central1-c"
}

