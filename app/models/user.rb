class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password validations: false
end
