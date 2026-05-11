resource random_integer name {
  min = 152
  max = 204

  lifecycle {
    ignore_changes = [min]
  }
}
