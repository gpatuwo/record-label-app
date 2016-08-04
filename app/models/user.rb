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

  after_initialize :ensure_session_token

  validates :email, :password_digest, :session_token, presence: true

  validates :email, :session_token, uniqueness: true

  validates :password_digest, presence: {message: "Password can't be blank"} #customize error message bc user won't know what password_digest is
  validates :password, length: {minimum: 6, allow_nil: true} #allow_nil => validation won't run if pw is blank...?

  attr_reader :password

  def self.find_by_crendentials(email, password)
    user = User.find_by_email(email)
    user && user.is_password?(password) ? user : nil
  end

  #1. hash password
  def password=(password)
    # need way to validate password, so create ivar and it won't get persisted to db
    @password = password
    self.password_digest = BCrypt::Password.create(password) # .create creates a Password object by hashing the input
  end

  #2. check for pw equality using bcrypt method .is_password
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password) #.new builds a Password obj from an existing, string hash
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token # make sure user's s_t is there or generate a new one if it's the first time they've logged in
    self.session_token ||= self.class.generate_session_token
  end

end
