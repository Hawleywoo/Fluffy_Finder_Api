class Breed < ApplicationRecord
    has_many :user_breeds
    has_many :users, through: :user_breeds
end
