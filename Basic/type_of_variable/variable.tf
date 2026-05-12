variable filename1 {
  type        = string
  default     = "sample1.txt"
}
variable content1 {
  type        = number
  default     = 2
  }

variable filename2 {
  type        = string
  default     = "sample2.txt"
}
# variable content2 {
#   type        = bool
#   default     = true
#   }

# variable content2 {
#   type = list(string)
#   default = ["red", "green", "blue"]
# }

# variable content2 {
#   type = tuple([string, number, bool])
#   default = ["red", 1, true]
# }


variable content2 {
  type = map
  default = {name = "Keshav", age = 30}
}