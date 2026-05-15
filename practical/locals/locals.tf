locals{
    resource_name = "${var.project_name}-${var.environment}"

    primary_subnet = var.subnet_names[0]

    subnet_count = length(var.subnet_names)

    is_production = var.environment == "prod"

    monitoring_Enabled = (
        var.monitoring || local.is_production
    )

    common_labels = {

    environment = var.environment
    managed_by  = "terraform"
    team        = "devops"

  }

}
