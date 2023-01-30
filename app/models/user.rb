class User < ApplicationRecord

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }

  def self.authenticate_with_credentials (email, password)
    user = User.find_by_email(email.strip.downcase)
    # If the user exists and the password entered is correct.
    if user && user.authenticate(password)
      return user
    end

    return false
  end

end
