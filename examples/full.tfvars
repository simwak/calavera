## General
release_name = "calavera"
display_name = "Calavera"
namespace = "calavera"
user_namespace = "calavera-user"
persistence = true
wait = false

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


enable_custom_ca = false
# Let's Encrypt Staging CA
custom_ca= <<EOF
-----BEGIN CERTIFICATE-----
MIIFATCCAumgAwIBAgIRAKc9ZKBASymy5TLOEp57N98wDQYJKoZIhvcNAQELBQAw
GjEYMBYGA1UEAwwPRmFrZSBMRSBSb290IFgxMB4XDTE2MDMyMzIyNTM0NloXDTM2
MDMyMzIyNTM0NlowGjEYMBYGA1UEAwwPRmFrZSBMRSBSb290IFgxMIICIjANBgkq
hkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA+pYHvQw5iU3v2b3iNuYNKYgsWD6KU7aJ
diddtZQxSWYzUI3U0I1UsRPTxnhTifs/M9NW4ZlV13ZfB7APwC8oqKOIiwo7IwlP
xg0VKgyz+kT8RJfYr66PPIYP0fpTeu42LpMJ+CKo9sbpgVNDZN2z/qiXrRNX/VtG
TkPV7a44fZ5bHHVruAxvDnylpQxJobtCBWlJSsbIRGFHMc2z88eUz9NmIOWUKGGj
EmP76x8OfRHpIpuxRSCjn0+i9+hR2siIOpcMOGd+40uVJxbRRP5ZXnUFa2fF5FWd
O0u0RPI8HON0ovhrwPJY+4eWKkQzyC611oLPYGQ4EbifRsTsCxUZqyUuStGyp8oa
aoSKfF6X0+KzGgwwnrjRTUpIl19A92KR0Noo6h622OX+4sZiO/JQdkuX5w/HupK0
A0M0WSMCvU6GOhjGotmh2VTEJwHHY4+TUk0iQYRtv1crONklyZoAQPD76hCrC8Cr
IbgsZLfTMC8TWUoMbyUDgvgYkHKMoPm0VGVVuwpRKJxv7+2wXO+pivrrUl2Q9fPe
Kk055nJLMV9yPUdig8othUKrRfSxli946AEV1eEOhxddfEwBE3Lt2xn0hhiIedbb
Ftf/5kEWFZkXyUmMJK8Ra76Kus2ABueUVEcZ48hrRr1Hf1N9n59VbTUaXgeiZA50
qXf2bymE6F8CAwEAAaNCMEAwDgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMB
Af8wHQYDVR0OBBYEFMEmdKSKRKDm+iAo2FwjmkWIGHngMA0GCSqGSIb3DQEBCwUA
A4ICAQBCPw74M9X/Xx04K1VAES3ypgQYH5bf9FXVDrwhRFSVckria/7dMzoF5wln
uq9NGsjkkkDg17AohcQdr8alH4LvPdxpKr3BjpvEcmbqF8xH+MbbeUEnmbSfLI8H
sefuhXF9AF/9iYvpVNC8FmJ0OhiVv13VgMQw0CRKkbtjZBf8xaEhq/YqxWVsgOjm
dm5CAQ2X0aX7502x8wYRgMnZhA5goC1zVWBVAi8yhhmlhhoDUfg17cXkmaJC5pDd
oenZ9NVhW8eDb03MFCrWNvIh89DDeCGWuWfDltDq0n3owyL0IeSn7RfpSclpxVmV
/53jkYjwIgxIG7Gsv0LKMbsf6QdBcTjhvfZyMIpBRkTe3zuHd2feKzY9lEkbRvRQ
zbh4Ps5YBnG6CKJPTbe2hfi3nhnw/MyEmF3zb0hzvLWNrR9XW3ibb2oL3424XOwc
VjrTSCLzO9Rv6s5wi03qoWvKAQQAElqTYRHhynJ3w6wuvKYF5zcZF3MDnrVGLbh1
Q9ePRFBCiXOQ6wPLoUhrrbZ8LpFUFYDXHMtYM7P9sc9IAWoONXREJaO08zgFtMp4
8iyIYUyQAbsvx8oD2M8kRvrIRSrRJSl6L957b4AFiLIQ/GgV2curs0jje7Edx34c
idWw1VrejtwclobqNMVtG3EiPUIpJGpbMcJgbiLSmKkrvQtGng==
-----END CERTIFICATE-----
EOF

## Compontens
enabled = {
  gitea = true
  gitlab = true
  openproject = true
  jenkins = true
  nexus = true
  mattermost = true
}

# Calavera Helm Chart
calavera_version = "0.2.1"

# Dashboard
dashboard_client_id = "dashboard"
dashboard_secret = "2af7855c-b7ba-4b71-b530-9be44ea27f5e"

## OpenLDAP
openldap_version = "1.2.5"
openldap_admin_password = "openldap"            # Should be random
openldap_config_password = "openldap"           # Should be random
openldap_organisation = "calavera"
openldap_domain = "calavera"
openldap_pvc_size = "5Gi"

## Keycloak
keycloak_version = "9.0.0"
keycloak_admin_user = {
  user = "keycloak"
  password = "keycloak"       # Should be random
}

# X.509 certificate
keycloak_rsa = { 
  certificate  = "MIIDTzCCAjagAwIBAgIBADANBgkqhkiG9w0BAQ0FADBBMQswCQYDVQQGEwJkZTEMMAoGA1UECAwDTlJXMREwDwYDVQQKDAhDYWxhdmVyYTERMA8GA1UEAwwIY2FsYXZlcmEwHhcNMjAwOTIwMTEyNDI3WhcNMzAwOTE4MTEyNDI3WjBBMQswCQYDVQQGEwJkZTEMMAoGA1UECAwDTlJXMREwDwYDVQQKDAhDYWxhdmVyYTERMA8GA1UEAwwIY2FsYXZlcmEwggEjMA0GCSqGSIb3DQEBAQUAA4IBEAAwggELAoIBAgDoHcV9ojN+KBA6B3tmYDFrEyVkt2kA4zS06Co8snULsBbnAP1A9AzlWwdSmxB7g+ZRGkgSHfGd2sCC8c4M2Sh6/Knpi0PDDvEmpQXC7vQSyoUECP80lqOuXceKT9sTx7Uf7WiuH1X7crJMQUd1wDL44kiGZzsrm0SGFyHG1S72wMkfDiK0HOud7v93enjg9vojotjW5FheKNn7U3InFILIJq1X3U0y9fKXL3Hgmc+SRgpktxd/k5nb7rrbnzk0luckFesMm90E+S7+ESlniUCkz/ofr+TqUYnzYJCQy24ql1rv1tuYoTiNcCAzcQAuvtPlg2c9/zEsNhHBzSTf6QmNIQIDAQABo1AwTjAdBgNVHQ4EFgQUIQ7LqPdeTf3go55cgadIveUcSXkwHwYDVR0jBBgwFoAUIQ7LqPdeTf3go55cgadIveUcSXkwDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQ0FAAOCAQIAndJEhDcH+haif7mx9cgbdKE1BTRCwqVVPWGnRx5B5NRxIhTuPOGDFiVOWzcuDgbGMgbnIjGBrC5wB3l4SFt82cRlk3cIKgDg0nM0U5Qqbc42emgoLXWXGJkwfHdii7HwuB8W5tXCUbXySZ3w5qdA1xR3R2qDUcRyIhVIGpZZfIozAH8upaCRRPnt0Et/x8GeEtNP+iBk18hLt6iuWMpoQMP2w+LoK/AldSaLtLr5VcXwtOzsK9OXYcqrftUT39yb6sLhs2htaQvv3jxF0NnV0i3FqtaU3Z+Fe+I6mv2ptXbjtCkVvLHJiD35LMEb4Dmx7JidIVeNT1HnJEyG3KqWtw8=" # Should be generated each time
  privateKey = "MIIEwgIBADANBgkqhkiG9w0BAQEFAASCBKwwggSoAgEAAoIBAgDoHcV9ojN+KBA6B3tmYDFrEyVkt2kA4zS06Co8snULsBbnAP1A9AzlWwdSmxB7g+ZRGkgSHfGd2sCC8c4M2Sh6/Knpi0PDDvEmpQXC7vQSyoUECP80lqOuXceKT9sTx7Uf7WiuH1X7crJMQUd1wDL44kiGZzsrm0SGFyHG1S72wMkfDiK0HOud7v93enjg9vojotjW5FheKNn7U3InFILIJq1X3U0y9fKXL3Hgmc+SRgpktxd/k5nb7rrbnzk0luckFesMm90E+S7+ESlniUCkz/ofr+TqUYnzYJCQy24ql1rv1tuYoTiNcCAzcQAuvtPlg2c9/zEsNhHBzSTf6QmNIQIDAQABAoIBAgDQ1Egj2dReAglnS+f3mT+cx+LylBiCVefLgrzNUvj/BPP17OvsjiU0DAuwhBX2KhsCiJSiyBHjJTXiGU56PL2wuLTdiw/x4/WOARYH5Rft+ApoMPf6BjVI4NJvW50MVLZd/Sgaz9J5oR1Mgcaa58p0JJF/akzP1Kd3xEP9MTtJgNmAks88K7V9p51ZZgyxExeh4QBMuob3XpXzZb40y6kg4Crcmr/L7BhNb3D4+whW2g+EWQXqWYrYH6vnqlQVvFwnX//f4TNs/tvi27c+RO+tR6ciGfg3dGG3yF0Bf5pb2SJUgl2/BHnHSw69/CXdbK2dnImihHYE/aZdYKLI3mBFaQKBgQ/suJW3genMbo/xxID9qF2OF1tZTUD1rq+WP9QEK1LaMYrJaKrHmXilHOdhtgHvIhZbAJiXZrFaoX2USFQowmbg+7mjnq3MScPP4vbBSfiMZTVXtKgH/Llik0kINfQLTxXIw6MtYunJMLGW0r9iBH2JBQOVxlX3++5d3Wx2YHgB2wKBgQ6TbHesS7yCS04loT2CAAOBlCErDKRgoRRflwcZ1BYlTQov4niWd4ZQIkPhDrYxMWt8uWmKF2cNUmW0GZk60tWSD64zumKF5fBcgkw0hsp8nGJ+N+0D5juxqPzHAeIZ/M8pd/3yTnbeRwewkbKFfomwRaMGcDPzziKLKhT0gAcTswKBgQqRWjEotVLU8m4dz/yV2Hw1RjS9v3GjWIh3WeY12hZCa+whGo9yo9sXH2ZBRopkCifxviSFHIYHkfGHTLRk1BV3qjUYar4FOtJyC7karh799FAA4wc7PbA8xWcKxtssAhB/yaxo+yIP/Httjm+o+TfhjO1DIHp+dbZKnh1TNVOOTwKBgQH7PnqCPIVyvOPxr5qZ6oCPg+CCZqSN0jffyrsXYsJj7bYdzk6QPc1PZWkO1h4kT9CJ0vaq5AWJRRM4SWaQHYsU4PbQZ1zvUNO876WGWnB6QhQNjnK03f5tZ0h9kR74Y2qR+5LU9p+oFcXQ1e2Lwijbgovn2ybk1LfTbTQODL1piwKBgQuSTO6aXv6uszBHfzHuN8Cw7bSD6AghJk2J5K82bkmInUur9QCQJ4fU+T5EkcqnN0mUrCHTTbD13ZRdqYoL3qzEfbUGIBC8q5U3mPiOGtoiYS9OhxfyzShJo7T0C0uyaragw4YTahTSNJhKot6kgzTUMIhVY9rZkPWHFgHwViW7Ag==" # Should be generated each time
}

keycloak_postgresql = {
  username = "keycloak"
  password = "keycloak"       # Should be random
  database = "keycloak"
}

keycloak_postgresql_pvc_size = "5Gi"

## GitTea
gitea_version = "1.4.1"
gitea_oauth = {
  id = "gitea"
  secret = "c1e99eff-d788-4d8b-b0fa-fda189dee70a"
}

gitea_postgresql_pvc_size = "5Gi"
gitea_pvc_size = "10Gi"

gitea_postgresql = {
  username = "gitea"
  password = "gitea"       # Should be random
  database = "gitea"
}

## GitLab
timezone = "Europe/Berlin"

gitlab_version = "4.3.6"
gitlab_saml = {
  id = "gitlab"
  secret = "c1e99eff-d788-4d8b-b0fa-fda189dee70b"
  fingerprint = "49:9E:28:85:88:62:A2:AB:E5:7D:0A:F8:B5:82:1C:AF:13:C7:4F:93" # Must be the fingerprint of keycloak_rsa.certificatelcv
}

gitlab_postgresql_pvc_size = "5Gi"
gitlab_gitaly_pvc_size = "50Gi"
gitlab_minio_pvc_size = "10Gi"

## OpenProject
openproject_version = "0.1.0"
openproject_postgresql = {
  username = "openproject"
  password = "openproject"       # Should be random
  database = "openproject"
}

openproject_pvc_size = "10Gi"
openproject_postgresql_pvc_size = "10Gi"

## Jenkins
# When enabling LDAP or another non-Jenkins identity source, the built-in admin account will no longer exist.
jenkins_version = "2.6.5"
jenkins_admin_user = {
  user = "jenkins"
  password = "jenkins"          # Should be random
}

jenkins_plugins = ["blueocean:1.24.0"]
jenkins_pvc_size = "10Gi"

## Mattermost
mattermost_version = "3.16.0"
mattermost_data_pvc_size = "10Gi"
mattermost_plugins_pvc_size = "1Gi"
mattermost_mysql_pvc_size = "10Gi"

mattermost_mysql = {
  username = "mattermost"
  password = "mattermost"       # Should be random
  database = "mattermost"
  root_password = "mattermost"       # Should be random
}

## Nexus
nexus_version = "2.8.0"
nexus_admin_password = "admin234"
nexus_pvc_size = "10Gi"