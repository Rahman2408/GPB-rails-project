class PartnershipsController < ApplicationController
  def index 
    
  end


  def new 
    @partnership  = Partnership.new
  end

  def create 
    
  end

  private 
  
  def partnership_params 
    params.require(:partnership).permit( )
  end
end