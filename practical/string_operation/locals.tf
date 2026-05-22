locals {
    vm_name = "${var.environment}-web-server"
    welcome_mesg = "hello ${var.environment}\nWelcome to Gcp"

}
locals{
    window_path = "C:\\Users\\Keshav"
    quote_example = "Server Name is \"web-server\""
    tab_example = "Env:\t${var.environment}"
}
locals {
    startup_script = <<-EOF
    #!/bin/bash
    echo "starting VM"
    apt update
    EOF
}

locals {
    user_config = <<-EOF
    %{ for user in var.users ~}
    useradd -m -s /bin/bash ${user}
    %{ endfor ~}
    EOF
}
locals {
    install_block = <<EOT
    %{ if var.install_nginx }
    sudo apt install nginx -y
    sudo systemctl start nginx
    %{ else }
    echo "Skipping nginx"
    %{ endif }
    EOT
}
locals {
    metadata_json = jsonencode({
        env = var.environment
        users = var.users
        server = local.vm_name
    })
}
