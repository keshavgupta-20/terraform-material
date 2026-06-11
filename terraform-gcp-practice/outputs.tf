output "networks" {
    value = module.networking.vpc-networks
}
output "subnetworks" {
    value = module.networking.subnetworks
}


output "firewall-rule" {
    value = module.networking.firewall_summary
}
output "buckets" {
    value = {
        bucket-name = module.storage.bucket_names
         
         project-number = module.storage.project-number,
         project_id =  module.storage.project-id,
         project_name = module.storage.project-name
    }
}
output "bucket-url"{
    value =  module.storage.bucket_urls
    sensitive = true
}