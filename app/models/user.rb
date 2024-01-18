# email:string
# password_digest:string
# 
# password:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: { with: /\A[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\z/, message: "is not valid" }, uniqueness: true
    normalizes :email, with: ->(email) { email.strip.downcase }

    generates_token_for :password_reset, expires_in: 15.minutes do
        password_salt&.last(10)
    end

    generates_token_for :email_confirmation, expires_in: 24.hours do
        email
    end
end
