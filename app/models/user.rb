class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true, length: { maximum: 50}
    validates :password, length: { minimum: 6}
    validates :email, presence: true, length: {maximum: 255},
                        format: { with: URI::MailTo::EMAIL_REGEXP },
                        uniqueness: { case_sensitive: true }

    has_many :contacts

end
