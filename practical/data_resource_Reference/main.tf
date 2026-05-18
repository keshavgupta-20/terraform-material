resource "terraform_data" "replacement" {
    triggers_replace = var.revision

}
resource "local_file" "demo" {
    filename = "sample.txt"
    content = "Terraform Demo"
    lifecycle {
        replace_triggered_by = [
            terraform_data.replacement
        ]
    }
}
