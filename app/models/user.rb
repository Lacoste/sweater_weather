class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email
  has_many :favorites
  has_secure_password

  def generate_api_key
    self.update_attributes(api_key: SecureRandom.urlsafe_base64)
  end

end
