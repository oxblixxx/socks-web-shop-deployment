data "kubectl_path_documents" "web-docs" {
    pattern = "./*.yaml"
}

resource "kubectl_manifest" "monitoring" {
    for_each  = toset(data.kubectl_path_documents.web-docs.documents)
    yaml_body = each.value
}
