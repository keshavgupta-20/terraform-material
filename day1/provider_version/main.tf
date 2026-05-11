resource random_integer name {
  min = 0
  max = maxvalue

  keepers = {
    id = value
  }
}
