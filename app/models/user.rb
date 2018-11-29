class EmailValidator < ActiveModel::Validator
  def validate(record)
    if EMAIL_DOMAINS.length > 0 || !EMAIL_DOMAINS.any? { |suffix| /#{Regexp.quote(suffix)}\z/ =~ record.email.downcase }
      record.errors[:email] << "Email must match one of [#{EMAIL_DOMAINS.join ", "}]"
    end 
  end
end

class User < ApplicationRecord
  validates :name, :email, :password_digest, presence: true
  validates :name, :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 8, allow_nil: true}
  validates_with EmailValidator

  after_initialize :ensure_session_token

  attr_reader :password

  def password=(password)
    # set a password ivar but also a BCrypt hash to persist
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password_digest
    # sneaky, sneaky: call super here to call password_digest on
    # ActiveRecord::Base, pass that value to the BCrypt initializer,
    # and return the BCrypt::Password instance (good at checking
    # strings to see if they match)
    BCrypt::Password.new(super)
  end

  def reset_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  ### --- CLASS METHODS --- ###

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    user && user.password_digest.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    # generate a token
    new_token = SecureRandom.urlsafe_base64(16)
    # make sure it's not already in use
    old_tokens = User.pluck(:session_token)
    until !old_tokens.include?(new_token)
      new_token = SecureRandom.urlsafe_base64(16)
    end
    # return non-conflicting token
    new_token
  end
  
  private

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
