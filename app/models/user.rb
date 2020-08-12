class User < ApplicationRecord
    has_many :user_breeds
    has_many :breeds, through: :user_breeds

    has_secure_password
end
