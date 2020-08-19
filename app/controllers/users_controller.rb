class UsersController < ApplicationController

    skip_before_action :authorized, only: [:create]
    
    def profile 

    end

    def create
        @user = User.new(username: params[:username], password: params[:password], email: params[:email])

        if @user.valid?
            @user.save
            secret = Rails.application.secret_key_base
            token = JWT.encode( {user_id: @user.id}, secret )
            render json: { user: @user, token: token }, status: :created
        else
            render json: { errors: @user.errors.full_messages }, status: :not_acceptable
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: :no_content
    end

end
