class UsersController < ApplicationController
    before_action :set_user, only: [:show, :index]
   
    def index
        @common_partners = User.common_partners(@user.id)     #temporary  -- mayber make private
        @other_users = User.other_users(@user.id) #temporary
    end

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
        @user = current_user
    end

    # def other_users
    #     arry = []
    #     User.all.each {|u| arry << u unless u.id == current_user.id  }
    #     arry
    # end
end
