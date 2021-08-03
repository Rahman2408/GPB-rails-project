class GroupsController < ApplicationController
  before_action :set_user
  
  def new 
    @partners = User.search(params[:query])
    @group  = group.new
  end

  def create 
    p = group.new(user_id: params[:user_id] , partner_id: params[:id])
      if p.save
        flash[:notice] = ["Success! Partner Added"]
        redirect_to new_user_group_path
      else
        flash[:errors]= [p.errors.full_messages]
        render partial: "partners"
      end
  end

  def delete 
    user = User.find(params[:user_id])
    user.partners.delete(params[:id])
    flash[:notice] = [" Partner Removed"]
        redirect_to user_groups_path
  end
  
  def index 
    @user = User.find(params[:user_id])
   @partners = @user.partners 
  end

  private 
   def set_user
    params[:user_id] = current_user.id
   end

  def group_params 
    params.require(:group).permit( :user_id, :partner_id)
    
  end
end