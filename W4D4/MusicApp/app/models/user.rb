require 'securerandom'

class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 5, allow_nil: true }
  after_initialize :ensure_session_token

  attr_reader :password

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(128)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password).to_s
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(128)
    self.save!
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user
    user.is_password?(password) ? user : nil
  end

  has_many :notes,
    class_name: :Note,
    primary_key: :id,
    foreign_key: :user_id

end
