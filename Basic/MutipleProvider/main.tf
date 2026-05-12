resource local_file res1 {
  content  = "This is the content of the file."
  filename = "output.txt"
}

resource random_string res2 {
  length  = 16
  special = false
  
}