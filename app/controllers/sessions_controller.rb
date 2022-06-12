class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :git_goin

    def login
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password]) 
            flash[:notices] = ["Welcome #{user.name}!"]
            session[:user_id] = user.id
            redirect_to root_path
        else 
            flash[:errors] = ["Incorrect Email or Password"]
            redirect_to login_path
        end
    end

    def logout
        session.clear 
        redirect_to login_path
    end

    def git_goin 
        user_creds = request.env["omniauth.auth"]
        user = User.github_access(user_creds)
        # byebug
            if user 
                session[:user_id] = user.id
                flash[:notices] = ["Welcome #{user.name}!"]
                redirect_to root_path
            else
                flash[:errors] = user.errors.full_messages
                redirect_to login_path
            end 
    end
end
