class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email

  has_secure_password

  def generate_api_key
    require 'securerandom'
    key = SecureRandom.urlsafe_base64
    self.api_key = key
  end

end
