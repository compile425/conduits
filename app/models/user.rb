class User < ApplicationRecord
    has_secure_password
    has_many :articles, foreign_key: "author_id", dependent: :destroy
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
    before_save { self.email = email.downcase }
end
