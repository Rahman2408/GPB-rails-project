class UsersController < ApplicationController
    before_action :set_user
    
    def new 
        @user = User.new 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end
    end

    def show
       
    end

    def update

    end


private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user 
        if params[:user_id]
            params[:user_id] = current_user.id
        else
            @user = User.find_by_id(current_user.id)
        end
    end
end
