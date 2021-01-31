project_id  = "your project name"
name        = "your project name"
region      = "europe-west2"
auth_net    = "172.30.0.0/20"
master_cidr = "172.16.0.0/28"
subnets = [
  {
    subnet_name   = "your project name-sub-europe-west2"
    subnet_ip     = "172.30.0.0/20"
    subnet_region = "europe-west2"
  }
]
secondary_ranges = {
  your project name-sub-europe-west2 = [
    {
      range_name    = "your project name-sub-europe-west2-pods"
      ip_cidr_range = "10.0.0.0/16"
    },
    {
      range_name    = "your project name-sub-europe-west2-services"
      ip_cidr_range = "10.1.0.0/16"
    }
  ]
}
source_ranges = ["your IP"]
runner_image  = "projects/debian-cloud/global/images/family/debian-10"
runner_tags   = ["ssh-ingress"]
