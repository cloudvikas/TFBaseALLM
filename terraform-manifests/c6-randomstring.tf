# Resource-2: Random String 
resource "random_string" "myrandom" {
  length = 2
  upper = false 
  special = false
}