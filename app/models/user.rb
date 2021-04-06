class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true , length:  {minimum: 3}
  validates :password_confirmation, presence: true

  validates_uniqueness_of :email, :case_sensitive => false
end

 