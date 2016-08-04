# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base

  validates :email, :password_digest, :session_token, presence: true

  validates :email, :session_token, uniqueness: true

  validates :password, length: {minimum: 6, message: "Password can't be blank"}

  #1. hash password, save it to db as password_digest
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  #2. check for pw equality using bcrypt method .is_password
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password) #.new won't save to db
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!

    self.save!
  end

  def ensure_session_token

  end
end
