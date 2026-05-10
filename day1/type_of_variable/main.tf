resource local_file sample_res {
    filename = var.filename1
    content = var.content1
}

resource local_file sample_res2 {
    filename = var.filename2
    content = var.content2["name"]
}