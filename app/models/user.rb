class User < ActiveRecord::Base

  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    user = User.find_by_email(email)

   if user && user.authenticate(password)
    user
   else
    nil
   end
  end

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true , length:  {minimum: 3}
  validates :password_confirmation, presence: true

  validates_uniqueness_of :email, :case_sensitive => false
end

 