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
            @user  = User.find([:user_id])
        else 
          @user = User.find(params[:id])
        end
    end

    # def other_users
    #     arry = []
    #     User.all.each {|u| arry << u unless u.id == current_user.id  }
    #     arry
    # end
end
