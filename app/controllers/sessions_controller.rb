class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create

    def login

    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password]) 
            flash[:notices] = ["Welcome back, #{user.name}!"]
            session[:user_id] = user.id
            redirect_to root_path
        # elsif params[:email].blank?
        #     @user = User.find_or_create_from_auth_hash(auth_hash)
        #     self.current_user = @user
        #     redirect_to root_path
        else 
            flash[:errors] = ["Incorrect Email or Password"]
            redirect_to login_path
        end
    end

    def logout
        session.clear 
        redirect_to login_path
    end

    private

    def auth_hash
        # request.env.['omniauth.auth']
    end
end
