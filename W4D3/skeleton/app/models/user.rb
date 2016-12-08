class User < ActiveRecord::Base
  validates :user_name, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 5, allow_nil: true }
  after_initialize :ensure_session_token

  has_many :cats,
    class_name: :Cat,
    foreign_key: :user_id,
    primary_key: :id

  attr_reader :password

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by_user_name(user_name)
    return nil unless user
    user.is_password?(password) ? user : nil
  end

end
