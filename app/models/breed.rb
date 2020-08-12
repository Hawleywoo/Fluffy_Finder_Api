class Breed < ApplicationRecord
    has_many :user_breeds
    has_many :users, thourgh: :user_breeds
end
