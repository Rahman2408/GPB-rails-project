class SessionsController < ApplicationController

    def login

    end

    def create
      user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            flash[:notices] = ["Welcome back, #{user.name}!"]
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

end
