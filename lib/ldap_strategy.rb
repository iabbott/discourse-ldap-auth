require 'omniauth-ldap'

class LDAPStrategy < OmniAuth::Strategies::LDAP
  # Maps the OmniAuth hash via a class-level mapping object that
  # determines which AD attributes to read. This is called in the
  # base class within the `callback_phase` on a successful LDAP
  # binding operation, using the `@@config` class variable as the
  # mapper and the LDAP return data from the main LDAP binding.
  def self.map_user(mapper, object)
    # Consider additional LDAP fields before mapping...
    mapper['name'] = ['displayName', 'cn']
    mapper['image'] = ['thumbnailPhoto', 'jpegPhoto']
    super
  end
end
