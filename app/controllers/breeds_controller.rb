class BreedsController < ApplicationController

    def index 
        @breeds = Breed.all

        render json: @breeds, except: [:created_at, :updated_at]
    end
end
