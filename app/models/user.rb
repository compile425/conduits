class User < ApplicationRecord
    has_secure_password
    has_many :conduits, foreign_key: "author_id", dependent: :destroy

    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 1, maximum: 50 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, length: { minimum: 1 }, if: -> { new_record? || !password.nil? }
    before_save { self.email = email.downcase }
    before_save { self.username = username.downcase if username.present? }
end
