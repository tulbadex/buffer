# email:string
# password_digest:string
# 
# password:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: { with: /\A[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\z/, message: "Email is not valid" }, uniqueness: true
end
