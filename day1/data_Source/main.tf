data local_file foo {
  filename = "foo.txt"
   
}

output name1 {
    value = data.local_file.foo.content
}