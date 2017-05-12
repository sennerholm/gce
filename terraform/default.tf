variable "gce_region" {
  description = "GCE Region"
  default     = "europe-west1"
}
// Should be possible to append to region but I don't know how...
variable "gce_zone" {
  description = "GCE Region"
  default     = "europe-west1-b"
}

variable "gce_zone_sec" {
  description = "GCE Region"
  default     = "europe-west1-c"
}

variable "gce_zone_tert" {
  description = "GCE Region"
  default     = "europe-west1-d"
}

