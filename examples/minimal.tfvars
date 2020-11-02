domains = {
  base = "calavera.example.com"
  api = "api.calavera.example.com"
  dashboard = "dashboard.calavera.example.com"
  auth = "auth.calavera.example.com"
  gitea = "gitea.calavera.example.com"
  gitlab = "gitlab.calavera.example.com"
  openproject = "openproject.calavera.example.com"
  jenkins = "jenkins.calavera.example.com"
  mattermost = "mattermost.calavera.example.com"
  nexus = "nexus.calavera.example.com"
  editor = "editor.calavera.example.com"
}

cert_resolver = "production"
entrypoints = {
  https = "websecure"
  http = "web" 
}

admin_user = {
  uid = "max.mustermann"
  name = "Max"
  surname = "Mustermann"
  mail = "max.mustermann@example.com"
  password = "hello123"
}

smtp = {
  host = "email-smtp.eu-central-1.amazonaws.com"
  port = 465
  auth = true
  user = "AKIAYHI"
  password = "BP0Gh7cC4"
  reply_to_display_name = "Calavera"
  starttls = true
  from = "no-reply@example.com"
  from_display_name = "Calavera"
  ssl = true
  encryption = "plain"
  connection_security = "tls"
}