resource "helm_release" "calavera" {
  name = local.name_calavera
  chart = "calavera"
  repository = "https://charts.simwak.dev"
  version = var.calavera_version
  namespace = var.namespace
  create_namespace = true
  wait = var.wait
  
  values = [ templatefile("${path.module}/values/calavera.yaml", 
  { 
    domains = var.domains
    keycloak_service = local.service_keycloak
    gitea_service = local.service_gitea
    gitlab_service = local.service_gitlab
    openproject_service = local.service_openproject
    jenkins_service = local.service_jenkins
    mattermost_service = local.service_mattermost
    nexus_service = local.service_nexus
    entrypoints = var.entrypoints
    cert_resolver = var.cert_resolver
    ldap = local.ldap
    smtp = var.smtp
    gitea_oauth = var.gitea_oauth
    gitlab_saml = var.gitlab_saml
    keycloak_rsa = var.keycloak_rsa
    admin_user = var.admin_user
    admin_user_password_base64 = base64encode(var.admin_user.password)
    enable_custom_ca = var.enable_custom_ca
    custom_ca = var.custom_ca
    enabled = var.enabled
    nexus_admin_password = var.nexus_admin_password
    display_name = var.display_name
    dashboard_client_id = var.dashboard_client_id
    dashboard_secret = var.dashboard_secret
    namespace = var.namespace
    user_namespace = var.user_namespace
    release_name = var.release_name
  })]
}

resource "helm_release" "openldap" {
  name = local.name_openldap
  chart = "openldap"
  repository = "https://kubernetes-charts.storage.googleapis.com"
  version = var.openldap_version
  namespace = var.namespace
  create_namespace = true
  wait = var.wait

  values = [ templatefile("${path.module}/values/openldap.yaml", 
  { 
    persistence = var.persistence
    organisation = var.openldap_organisation
    domain = var.openldap_domain
    admin_password = var.openldap_admin_password
    config_password = var.openldap_config_password
    persistence_size = var.openldap_pvc_size
  })]
}

resource "helm_release" "keycloak" {
  name = local.name_keycloak
  chart = "keycloak"
  repository = "https://codecentric.github.io/helm-charts"
  version = var.keycloak_version
  namespace = var.namespace
  create_namespace = true
  wait = var.wait

  values = [ templatefile("${path.module}/values/keycloak.yaml", 
  { 
    admin = var.keycloak_admin_user
    realm_configmap = local.keycloak_realm_configmap
    persistence = var.persistence
    postgresql = var.keycloak_postgresql
    persistence_postgresql_size = var.keycloak_postgresql_pvc_size
  })]
}

resource "helm_release" "gitea" {
  count = var.enabled.gitea ? 1 : 0
  name = local.name_gitea
  chart = "gitea"
  repository = "https://charts.simwak.dev"
  version = var.gitea_version
  namespace = var.namespace
  create_namespace = true
  wait = var.wait

  values = [ templatefile("${path.module}/values/gitea.yaml", 
  { 
    persistence = var.persistence
    domains = var.domains
    postgresql = var.gitea_postgresql
    ldap = local.ldap
    oauth = var.gitea_oauth
    oauth_url = local.gitea_oauth_url
    oauth_name = "${ local.name_gitea }-oauth"
    ldap_name = "${ local.name_gitea }-ldap"
    admin = var.gitea_admin_user
    enable_custom_ca = var.enable_custom_ca
    custom_ca = var.custom_ca
    persistence_size_postgresql = var.gitea_postgresql_pvc_size
    persistence_size = var.gitea_pvc_size
  })]
}

resource "helm_release" "gitlab" {
  count = var.enabled.gitlab ? 1 : 0
  name = local.name_gitlab
  chart = "gitlab"
  repository = "https://charts.gitlab.io/"
  version = var.gitlab_version
  namespace = var.namespace
  create_namespace = true
  wait = var.wait

  values = [ templatefile("${path.module}/values/gitlab.yaml", 
  { 
    persistence = var.persistence
    domains = var.domains
    ldap = local.ldap
    smtp = var.smtp
    timezone = var.timezone
    saml_secret = local.gitlab_saml_secret
    ca_secret = local.ca_secret
    enable_custom_ca = var.enable_custom_ca
    persistence_size_postgresql = var.gitlab_postgresql_pvc_size
    persistence_size_gitaly = var.gitlab_gitaly_pvc_size
    persistence_size_minio = var.gitlab_minio_pvc_size
    release_name = var.release_name
  })]
}

resource "helm_release" "openproject" {
  count = var.enabled.openproject ? 1 : 0
  name = local.name_openproject
  chart = "openproject"
  repository = "https://charts.simwak.dev/"
  version = var.openproject_version
  namespace = var.namespace
  create_namespace = true
  wait = var.wait
  
  values = [ templatefile("${path.module}/values/openproject.yaml", 
  { 
    persistence = var.persistence
    postgresql = var.openproject_postgresql
    domains = var.domains
    ldap = local.ldap
    smtp = var.smtp
    persistence_size = var.openproject_pvc_size
    persistence_postgresql_size = var.openproject_postgresql_pvc_size
  })]
}

resource "helm_release" "jenkins" {
  count = var.enabled.jenkins ? 1 : 0
  name = local.name_jenkins
  chart = "jenkins"
  repository = "https://charts.jenkins.io"
  version = var.jenkins_version
  namespace = var.namespace
  create_namespace = true
  wait = var.wait

  values = [ templatefile("${path.module}/values/jenkins.yaml",
  {
    persistence = var.persistence
    admin_user = var.jenkins_admin_user
    ldap = local.ldap
    domains = var.domains
    additional_plugins = yamlencode(var.jenkins_plugins)
    release_name = var.release_name
    enable_custom_ca = var.enable_custom_ca
    ca_secret = local.ca_secret
    persistence_size = var.jenkins_pvc_size
  })]
}

resource "helm_release" "mattermost" {
  count = var.enabled.mattermost ? 1 : 0
  name = local.name_mattermost
  chart = "mattermost-team-edition"
  repository = "https://helm.mattermost.com"
  version = var.mattermost_version
  namespace = var.namespace
  create_namespace = true
  wait = var.wait

  values = [ templatefile("${path.module}/values/mattermost.yaml",
  {
    persistence = var.persistence
    domains = var.domains
    display_name = var.display_name
    smtp = var.smtp
    release_name = var.release_name
    ca_secret = local.ca_secret
    enable_custom_ca = var.enable_custom_ca
    persistence_data_size = var.mattermost_data_pvc_size
    persistence_plugins_size = var.mattermost_plugins_pvc_size
    persistence_mysql_size = var.mattermost_mysql_pvc_size
    mysql = var.mattermost_mysql
    ldap = local.ldap
  })]
}

resource "helm_release" "nexus" {
  count = var.enabled.nexus ? 1 : 0
  name = local.name_nexus
  chart = "sonatype-nexus"
  repository = "https://oteemo.github.io/charts"
  version = var.nexus_version
  namespace = var.namespace
  create_namespace = true
  wait = var.wait

  values = [ templatefile("${path.module}/values/nexus.yaml",
  {
    persistence = var.persistence
    nexus_service = local.service_nexus
    domains = var.domains
    enable_custom_ca = var.enable_custom_ca
    persistence_size = var.nexus_pvc_size
  })]
}