output "project-name" {
    value = data.google_project.current.name
} 
output "project-number" {
    value = data.google_project.current.number
} 
output "project-id" {
    value = data.google_project.current.project_id
} 


output "bucket_names" {
  value = [
    for bucket in google_storage_bucket.buckets :
    bucket.name
  ]
}

output "bucket_urls" {
  value = [
    for bucket in google_storage_bucket.buckets :
    bucket.url
  ]

  sensitive = true
}