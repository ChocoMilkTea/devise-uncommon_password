require 'devise'
require 'devise/uncommon_password/model'

module Devise
  mattr_accessor :password_matches, :password_text_file
  @@password_matches = 100
  @@password_text_file = 'passwords.txt'
  module UncommonPassword
  end
end

# Load default I18n
I18n.load_path.unshift File.join(File.dirname(__FILE__), *%w[uncommon_password locales en.yml])

Devise.add_module :uncommon_password, model: "devise_uncommon_password/model"
