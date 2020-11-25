project_id    = "cloudymation"
name          = "cloudymation"
region        = "europe-west2"
auth_net      = "172.30.0.0/20"
master_cidr   = "172.16.0.0/28"
image         = "projects/cloudymation/global/images/family/jumpbox"
jumpbox_tags  = ["ssh-ingress", "http-ingress"]
