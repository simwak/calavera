# General
variable "release_name" {
  description = "Release name of the deployed charts"
  type = string
  default = "calavera"
}

variable "display_name" {
  description = "Display name of the solution. For example used in the dashboard"
  type = string
  default = "Calavera"
}

variable "namespace" {
  description = "Kubernetes Namespace where the charts will be deployed"
  type = string
  default = "calavera"
}

variable "user_namespace" {
  description = "User Kubernetes Namespace. Used for user deployments"
  type = string
  default = "calavera-user"
}

variable "persistence" {
  description = "Can disable the persistence for all charts"
  type = bool
  default = true
}

variable "wait" {
  description = "Terraform will wait until all deployments are ready"
  type = bool
  default = false
}

variable "admin_user" {
  description = "The default admin user for all services"
  type = object({
    uid = string
    name = string
    surname = string
    mail = string
    password = string
  })
  default = {
    uid = "john.doe"
    name = "John"
    surname = "Doe"
    mail = "john.doe@example.com"
    password = "example"
  }
}

variable "cert_resolver" {
  description = "Traefik 2 certificate resolver"
  type = string
  default = "staging"
}

variable "entrypoints" {
  description = "Traefik 2 entrypoints"
  type = object({
    https = string
    http = string
  })
  default = {
    https = "websecure"
    http = "web" 
  }
}

variable "enabled" {
  description = "Can enable or disable services"
  type = object({
    gitea = bool
    gitlab = bool
    openproject = bool
    jenkins = bool
    nexus = bool
    mattermost = bool
  })
  default = {
    gitea = true
    gitlab = true
    openproject = true
    jenkins = true
    nexus = true
    mattermost = true
  }
}

variable "enable_custom_ca" {
  description = "Can enable the usage of a custom CA"
  type = bool
  default = false
}

variable "custom_ca" {
  description = "The custom CA if enable_custom_ca is set to true"
  type = string
  default = ""
}

variable "smtp" {
  description = "Email configuration"
  type = object({
    host = string
    port = number
    auth = bool
    user = string
    password = string
    reply_to_display_name = string
    starttls = bool
    from = string
    from_display_name = string
    ssl = bool
    encryption = string
    connection_security = string
  })
  default = {
    host = "smtp.example.com"
    port = 465
    auth = true
    user = "some-username"
    password = "a-password"
    reply_to_display_name = "Calavera"
    starttls = "true"
    from = "no-reply@example.com"
    from_display_name = "Calavera"
    ssl = "true"
    encryption = "plain"
    connection_security = "tls"
  }
}

variable "domains" {
  description = "Domain configuration for the services"
  type = object({
    base = string
    auth = string
    api = string
    dashboard = string
    gitea = string
    gitlab = string
    openproject = string
    jenkins = string
    mattermost = string
    nexus = string
    editor = string
  })
  default = {
    base = "example.com"
    auth = "auth.example.com"
    api = "api.example.com"
    dashboard = "dashboard.example.com"
    gitea = "gitea.example.com"
    gitlab = "gitlab.example.com"
    openproject = "openproject.example.com"
    jenkins = "jenkins.example.com"
    mattermost = "mattermost.example.com"
    nexus = "nexus.example.com"
    editor = "editor.example.com"
  }
}

variable "calavera_version" {
  description = "Chart version of Calavera"
  type = string
  default = "0.2.1"
}

# API
variable "dashboard_client_id" {
  description = "OpenID Connect client id for the Dashboard"
  type = string
  default = "dashboard"
}

variable "dashboard_secret" {
  description = "OpenID Connect client secret for the Dashboard"
  type = string
  default = "2af7855c-b7ba-4b71-b530-9be44ea27f5e"
}

# OpenLDAP
variable "openldap_version" {
  description = "Chart version of the OpenLAP"
  type = string
  default = "1.2.5"
}

variable "openldap_admin_password" {
  description = "OpenLDAP admin password"
  type = string
  default = "openldap"
}

variable "openldap_config_password" {
  description = "OpenLDAP config password"
  type = string
  default = "openldap"
}

variable "openldap_organisation" {
  description = "OpenLDAP default organisation"
  type = string
  default = "calavera"
}

variable "openldap_domain" {
  description = "OpenLDAP default domain"
  type = string
  default = "calavera"
}

variable "openldap_pvc_size" {
  description = "OpenLDAP storage size"
  type = string
  default = "5Gi"
}

# Keycloak
variable "keycloak_version" {
  description = "Chart version of Keycloak"
  type = string
  default = "9.0.0"
}

variable "keycloak_admin_user" {
  description = "Keycloak Admin user"
  type = object({
    user = string
    password = string
  })
  default = {
    user = "keycloak"
    password = "keycloak"
  }
}

variable "keycloak_rsa" {
  description = "Keycloak certificate for SSO (SAML)"
  type = object({
    certificate = string
    privateKey = string
  })
  default = {
    certificate  = "MIIDTzCCAjagAwIBAgIBADANBgkqhkiG9w0BAQ0FADBBMQswCQYDVQQGEwJkZTEMMAoGA1UECAwDTlJXMREwDwYDVQQKDAhDYWxhdmVyYTERMA8GA1UEAwwIY2FsYXZlcmEwHhcNMjAwOTIwMTEyNDI3WhcNMzAwOTE4MTEyNDI3WjBBMQswCQYDVQQGEwJkZTEMMAoGA1UECAwDTlJXMREwDwYDVQQKDAhDYWxhdmVyYTERMA8GA1UEAwwIY2FsYXZlcmEwggEjMA0GCSqGSIb3DQEBAQUAA4IBEAAwggELAoIBAgDoHcV9ojN+KBA6B3tmYDFrEyVkt2kA4zS06Co8snULsBbnAP1A9AzlWwdSmxB7g+ZRGkgSHfGd2sCC8c4M2Sh6/Knpi0PDDvEmpQXC7vQSyoUECP80lqOuXceKT9sTx7Uf7WiuH1X7crJMQUd1wDL44kiGZzsrm0SGFyHG1S72wMkfDiK0HOud7v93enjg9vojotjW5FheKNn7U3InFILIJq1X3U0y9fKXL3Hgmc+SRgpktxd/k5nb7rrbnzk0luckFesMm90E+S7+ESlniUCkz/ofr+TqUYnzYJCQy24ql1rv1tuYoTiNcCAzcQAuvtPlg2c9/zEsNhHBzSTf6QmNIQIDAQABo1AwTjAdBgNVHQ4EFgQUIQ7LqPdeTf3go55cgadIveUcSXkwHwYDVR0jBBgwFoAUIQ7LqPdeTf3go55cgadIveUcSXkwDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQ0FAAOCAQIAndJEhDcH+haif7mx9cgbdKE1BTRCwqVVPWGnRx5B5NRxIhTuPOGDFiVOWzcuDgbGMgbnIjGBrC5wB3l4SFt82cRlk3cIKgDg0nM0U5Qqbc42emgoLXWXGJkwfHdii7HwuB8W5tXCUbXySZ3w5qdA1xR3R2qDUcRyIhVIGpZZfIozAH8upaCRRPnt0Et/x8GeEtNP+iBk18hLt6iuWMpoQMP2w+LoK/AldSaLtLr5VcXwtOzsK9OXYcqrftUT39yb6sLhs2htaQvv3jxF0NnV0i3FqtaU3Z+Fe+I6mv2ptXbjtCkVvLHJiD35LMEb4Dmx7JidIVeNT1HnJEyG3KqWtw8="
    privateKey = "MIIEwgIBADANBgkqhkiG9w0BAQEFAASCBKwwggSoAgEAAoIBAgDoHcV9ojN+KBA6B3tmYDFrEyVkt2kA4zS06Co8snULsBbnAP1A9AzlWwdSmxB7g+ZRGkgSHfGd2sCC8c4M2Sh6/Knpi0PDDvEmpQXC7vQSyoUECP80lqOuXceKT9sTx7Uf7WiuH1X7crJMQUd1wDL44kiGZzsrm0SGFyHG1S72wMkfDiK0HOud7v93enjg9vojotjW5FheKNn7U3InFILIJq1X3U0y9fKXL3Hgmc+SRgpktxd/k5nb7rrbnzk0luckFesMm90E+S7+ESlniUCkz/ofr+TqUYnzYJCQy24ql1rv1tuYoTiNcCAzcQAuvtPlg2c9/zEsNhHBzSTf6QmNIQIDAQABAoIBAgDQ1Egj2dReAglnS+f3mT+cx+LylBiCVefLgrzNUvj/BPP17OvsjiU0DAuwhBX2KhsCiJSiyBHjJTXiGU56PL2wuLTdiw/x4/WOARYH5Rft+ApoMPf6BjVI4NJvW50MVLZd/Sgaz9J5oR1Mgcaa58p0JJF/akzP1Kd3xEP9MTtJgNmAks88K7V9p51ZZgyxExeh4QBMuob3XpXzZb40y6kg4Crcmr/L7BhNb3D4+whW2g+EWQXqWYrYH6vnqlQVvFwnX//f4TNs/tvi27c+RO+tR6ciGfg3dGG3yF0Bf5pb2SJUgl2/BHnHSw69/CXdbK2dnImihHYE/aZdYKLI3mBFaQKBgQ/suJW3genMbo/xxID9qF2OF1tZTUD1rq+WP9QEK1LaMYrJaKrHmXilHOdhtgHvIhZbAJiXZrFaoX2USFQowmbg+7mjnq3MScPP4vbBSfiMZTVXtKgH/Llik0kINfQLTxXIw6MtYunJMLGW0r9iBH2JBQOVxlX3++5d3Wx2YHgB2wKBgQ6TbHesS7yCS04loT2CAAOBlCErDKRgoRRflwcZ1BYlTQov4niWd4ZQIkPhDrYxMWt8uWmKF2cNUmW0GZk60tWSD64zumKF5fBcgkw0hsp8nGJ+N+0D5juxqPzHAeIZ/M8pd/3yTnbeRwewkbKFfomwRaMGcDPzziKLKhT0gAcTswKBgQqRWjEotVLU8m4dz/yV2Hw1RjS9v3GjWIh3WeY12hZCa+whGo9yo9sXH2ZBRopkCifxviSFHIYHkfGHTLRk1BV3qjUYar4FOtJyC7karh799FAA4wc7PbA8xWcKxtssAhB/yaxo+yIP/Httjm+o+TfhjO1DIHp+dbZKnh1TNVOOTwKBgQH7PnqCPIVyvOPxr5qZ6oCPg+CCZqSN0jffyrsXYsJj7bYdzk6QPc1PZWkO1h4kT9CJ0vaq5AWJRRM4SWaQHYsU4PbQZ1zvUNO876WGWnB6QhQNjnK03f5tZ0h9kR74Y2qR+5LU9p+oFcXQ1e2Lwijbgovn2ybk1LfTbTQODL1piwKBgQuSTO6aXv6uszBHfzHuN8Cw7bSD6AghJk2J5K82bkmInUur9QCQJ4fU+T5EkcqnN0mUrCHTTbD13ZRdqYoL3qzEfbUGIBC8q5U3mPiOGtoiYS9OhxfyzShJo7T0C0uyaragw4YTahTSNJhKot6kgzTUMIhVY9rZkPWHFgHwViW7Ag=="
  }
}

variable "keycloak_postgresql" {
  description = "Keycloak database configuration"
  type = object({
    username = string
    password = string
    database = string
  })
  default = {
    username = "keycloak"
    password = "keycloak"
    database = "keycloak"
  }
}
variable "keycloak_postgresql_pvc_size" {
  description = "Keycloak database storage size"
  type = string
  default = "5Gi"
}

# Gitea
variable "gitea_version" {
  description = "Chart version of Gitea"
  type = string
  default = "1.4.1"
}

variable "gitea_oauth" {
  description = "Gitea OAuth configuration"
  type = object({
    id = string
    secret = string
  })
  default = {
    id = "gitea"
    secret = "something-random"
  }
}

variable "gitea_postgresql" {
  description = "Gitea OAuth configuration"
  type = object({
    username = string
    password = string
    database = string
  })
  default = {
    username = "gitea"
    password = "gitea"
    database = "gitea"
  }
}

variable "gitea_admin_user" {
  description = "Gitea admin user"
  type = object({
    user = string
    password = string
    email = string
  })
  default = {
    user = "gitea"
    password = "gitea"
    email = "gitea@example.com"
  }
}

variable "gitea_pvc_size" {
  description = "Gitea storage size"
  type = string
  default = "10Gi"
}

variable "gitea_postgresql_pvc_size" {
  description = "Gitea database storage size"
  type = string
  default = "5Gi"
}

# Gitlab
variable "gitlab_version" {
  description = "Chart version of GitLab"
  type = string
  default = "4.3.4"
}


variable "timezone" {
  description = "Timezone set in GitLab"
  type = string
  default = "Europe/Berlin"
}

variable "gitlab_saml" {
  description = "GitLab SAML configuration"
  type = object({
    id = string
    secret = string
    fingerprint = string
  })
  default = {
    id = "gitlab"
    secret = "something-random"
    fingerprint = "49:9E:28:85:88:62:A2:AB:E5:7D:0A:F8:B5:82:1C:AF:13:C7:4F:93" # Fingerprint of keycloak_rsa.certificate
  }
}

variable "gitlab_postgresql_pvc_size" {
  description = "GitLab database storage size"
  type = string
  default = "5Gi"
}

variable "gitlab_gitaly_pvc_size" {
  description = "GitLab repository storage size"
  type = string
  default = "50Gi"
}

variable "gitlab_minio_pvc_size" {
  description = "GitLab MinIO storage size"
  type = string
  default = "10Gi"
}

# OpenProject
variable "openproject_version" {
  description = "Chart version of OpenProject"
  type = string
  default = "0.1.0"
}

variable "openproject_postgresql" {
  description = "OpenProject database configuration"
  type = object({
    username = string
    password = string
    database = string
  })
  default = {
    username = "openproject"
    password = "openproject"
    database = "openproject"
  }
}

variable "openproject_pvc_size" {
  description = "OpenProject storage size"
  type = string
  default = "10Gi"
}

variable "openproject_postgresql_pvc_size" {
  description = "OpenProject database storage size"
  type = string
  default = "10Gi"
}

# Jenkins
variable "jenkins_version" {
  description = "Chart version of jenkins"
  type = string
  default = "2.6.5"
}

variable "jenkins_admin_user" {
  description = "Chart version of Jenkins"
  type = object({
    user = string
    password = string
  })
  default = {
    user = "jenkins"
    password = "jenkins"
  }
}

variable "jenkins_pvc_size" {
  description = "Jenkins storage size"
  type = string
  default = "10Gi"
}

variable "jenkins_plugins" {
  description = "Jenkins plugins"
  type = list(string)
  default = []
}

# Mattermost
variable "mattermost_version" {
  description = "Chart version of Mattermost"
  type = string
  default = "3.16.0"
}

variable "mattermost_data_pvc_size" {
  description = "Mattermost storage size"
  type = string
  default = "10Gi"
}

variable "mattermost_mysql_pvc_size" {
  description = "Mattermost database storage size"
  type = string
  default = "10Gi"
}

variable "mattermost_plugins_pvc_size" {
  description = "Mattermost plugins storage size"
  type = string
  default = "1Gi"
}

variable "mattermost_mysql" {
  description = "Mattermost database configuration"
  type = object({
    username = string
    password = string
    database = string
    root_password = string
  })
  default = {
    username = "mattermost"
    password = "mattermost"
    database = "mattermost"
    root_password = "mattermost"
  }
}

# Nexus
variable "nexus_version" {
  description = "Chart version of Nexus OSS"
  type = string
  default = "2.8.0"
}

variable "nexus_admin_password" {
  description = "Nexus administrator password"
  type = string
  default = "admin123"
}

variable "nexus_pvc_size" {
  description = "Nexus storage size"
  type = string
  default = "10Gi"
}
