variable "pet_count" { default = 5 }
variable "default_prefix" { default = "Whiskers" }
variable "zoo_enabled" { default = false }
variable "prefix_list" { default = ["Whiskers", "Spot", "Fluffy", "Rex", "Pistol", "Pookie"] }

resource "random_pet" "my_pet" {
  count  = var.pet_count
  separator = " "
  length = "3"
  prefix = var.zoo_enabled ? element(var.prefix_list, count.index) : var.default_prefix
}

output "pet_out" {
  value = random_pet.my_pet[*].id
}