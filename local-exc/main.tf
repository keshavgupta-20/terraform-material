terraform {
	required_providers {
		random = {
			source  = "hashicorp/random"
			version = "~> 3.6"
		}
	}
}

# resource "random_integer" "number" {
# 	min = 1
# 	max = 50
#     keeper{
        
#     }
# }

# output "random_number" {
# 	value =  range(1, 51)
# }
