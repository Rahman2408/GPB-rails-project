class PartnershipsController < ApplicationController
  before_action :set_user
  
  def find_partners
    @partners = User.search(params[:query])
  end

  def new 
    @partnership  = Partnership.new
  end

  def create 
    
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