project_id = "cloudymation"
name       = "cloudymation"
region     = "europe-west2"
subnets = [
  {
    subnet_name   = "cloudymation-sub-europe-west2"
    subnet_ip     = "172.30.0.0/20"
    subnet_region = "europe-west2"
  }
]
secondary_ranges = {
  cloudymation-sub-europe-west2 = [
    {
      range_name    = "cloudymation-sub-europe-west2-pods"
      ip_cidr_range = "10.0.0.0/16"
    },
    {
      range_name    = "cloudymation-sub-europe-west2-services"
      ip_cidr_range = "10.1.0.0/16"
    }
  ]
}
source_ranges = ["your IP range"]
image         = "projects/cloudymation/global/images/family/jenkins"
jenkins_tags  = ["ssh-ingress", "http-ingress"]
