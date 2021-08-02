class PartnershipsController < ApplicationController
  before_action :set_user
  
 

  def new 
    @partners = User.search(params[:query])
    @partnership  = Partnership.new
  end

  def create 
    
    p = Partnership.new(user_id: params[:user_id] , partner_id: params[:id])
      if p.save
        flash[:notice] = ["Success! Partner Added"]
        redirect_to user_partnerships_path
      else
        flash[:errors]= [p.errors.full_messages]
        render partial: "partners"
      end

  end

  def delete 
    user = User.find(params[:user_id])
    user.partners.delete(params[:id])
    flash[:notice] = [" Partner Removed"]
        redirect_to user_partnerships_path
  end
  
  def index 
    @user = User.find(params[:user_id])
   @partners = @user.partners 
  end

  private 
   def set_user
    params[:user_id] = current_user.id
   end

  def partnership_params 
    params.require(:partnership).permit( :user_id, :partner_id)
  end
end