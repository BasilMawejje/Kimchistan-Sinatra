require 'pony'

Pony.options = {
  via: :smtp,
  via_options: {
    address:              'smtp',
    port:                 '587',
    enable_starttls_auto: true,
    authentication:       :plain,
    domain:               "localhost.localdomain"
  }
}
