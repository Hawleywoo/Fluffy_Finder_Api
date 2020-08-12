class UserBreed < ApplicationRecord
  belongs_to :users
  belongs_to :breeds
end
