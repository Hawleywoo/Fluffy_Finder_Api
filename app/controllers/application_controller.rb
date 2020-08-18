class ApplicationController < ActionController::API
    before_action :authorized
    skip_before_action :authorized, only: [:login]

    def current_user 
        auth_header = request.headers['Authorization']
        secret = Rails.application.secret_key_base
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                @user_id = JWT.decode(token, secret)[0]["user_id"]
            rescue JWT::DecodeError
                nil     
            end
        end
        @user = User.find(@user_id)
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: {message: 'Please Log In'}, status: :unathorized unless logged_in
    end

    def login
        @user = User.find_by(username: params[:username])

        if @user && user.authenticate(params[:password])
            secret = Rails.application.secret_key_base
            @token = JWT.encode({user_id: @user.id}, secret)
            render json: {user: @user, breeds: @user.breeds, token: token }, status: :accepted
        else
            render json: { errors: ['Invalid username or Password']}, status: :unatuhorized
        end
    end

end
