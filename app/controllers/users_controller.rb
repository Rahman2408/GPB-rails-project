class UsersController < ApplicationController
    before_action :set_user, only: [:show, :index, :edit, :update]
   
    def index
      # byebug
        if params[:query]
          @partners = @user.partners.partner_search(params[:query])
        else    
          @partners = @user.partners    
          @other_users = User.other_users(@user.id)
        end
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

    def edit
    end

    def show 
    end

    def update
      @user.update(name: user_params[:name], email: user_params[:email])
        if @user.save
          flash[:notices] = ["Profile Successfully Updated!"]
          redirect_to user_path(@user)
        else
          flash[:errors] = @user.errors.full_messages
          render :edit
        end
    end

private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user 
      @user = current_user
    end
end
