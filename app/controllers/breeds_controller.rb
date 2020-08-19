class BreedsController < ApplicationController
    skip_before_action :authorized, only: [:index]
    
    def index 
        @breeds = Breed.all

        render json: @breeds, except: [:created_at, :updated_at]
    end
end
