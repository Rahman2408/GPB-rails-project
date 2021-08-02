class ProjectsController < ApplicationController
  def index 
    @projects = Project.all
  end


  def new 
    @project = Project.new
  end

  def create 
    
  end

  private 
  
  def project_params 
    params.require(:project).permit(:title, :goal, user_ids:[])
  end
end
