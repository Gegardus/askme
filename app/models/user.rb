require "openssl"

class User < ApplicationRecord
  # encryption module parameters
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new
  has_many :questions

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true

  attr_accessor :password

  validates_presence_of :password, on: :create
  validates_confirmation_of :password

  before_save :encrypt_password

  def encrypt_password
    if self.password.present?
      # create salt of password
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      # create hash of password
      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATIONS, DIGEST.length, DIGEST)
      )
    end
  end

  # transforms binary string to 16 format
  def self.hash_to_string(password_hash)
    password_hash.unpack("H*")[0]
  end

  def self.authenticate(email, password)
    user.find_by(email: email)

    if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATIONS, DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end
end
