locals {
  release_name = lower(var.release_name)

  name_calavera = "${ local.release_name }-base"
  name_openldap = "${ local.release_name }-openldap"
  name_keycloak = "${ local.release_name }-keycloak"
  name_gitea = "${ local.release_name }-gitea"
  name_gitlab = "${ local.release_name }-gitlab"
  name_openproject = "${ local.release_name }-openproject"
  name_jenkins= "${ local.release_name }-jenkins"
  name_mattermost = "${ local.release_name }-mattermost"
  name_nexus = "${ local.release_name }-nexus"
  
  service_keycloak = "${ local.name_keycloak }-http"
  service_gitea = "${ local.name_gitea }-http"
  service_gitlab = "${ local.name_gitlab }-webservice"
  service_openproject = "${ local.name_openproject }"
  service_jenkins = "${ local.name_jenkins }"
  service_mattermost = "mattermost-team-edition"
  service_nexus = "${ local.name_nexus }-sonatype-nexus"

  ca_secret = "${ local.name_calavera }-custom-ca"

  keycloak_realm_configmap = "${ local.name_calavera }-realm"

  ldap_dc = "dc=${ replace(var.openldap_domain, ".", ",dc=") }"

  ldap = {
    dc = local.ldap_dc
    host = local.name_openldap
    bind_dn = "cn=admin,${ local.ldap_dc}"
    bind_credential = var.openldap_admin_password
    config_bind_credential = var.openldap_config_password
    bind_credential_secret = {
      name = "${local.name_calavera}-ldap"
      key = "password"
    }
    users_dn = "ou=users,${ local.ldap_dc}"
    users_dn_relative = "ou=users"
    port = 389
    connection_url = "ldap://${ local.name_openldap }:389"
    security_protocol = "unencrypted"
    encryption = "plain"
    groups_dn = "ou=groups,${ local.ldap_dc}"
    protocol = "ldap"
    email_attribute = "mail"
    user_object_class= "inetOrgPerson"
    username_attribute = "uid"
    firstname_attribute = "cn"
    lastname_attribute = "sn"
    memberof_attribute = "memberOf"
    user_filter = "(uid=%s)"
    tls_mode = 0
    admin_filter = "(memberOf=CN=admins,cn=groups,${ local.ldap_dc}"
  }

  gitea_oauth_url = "https://${ var.domains.auth }/auth/realms/calavera/.well-known/openid-configuration"
  gitlab_saml_secret = "${ local.name_calavera }-saml-secret"
}
