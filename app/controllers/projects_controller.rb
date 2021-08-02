class ProjectsController < ApplicationController
  before_action :set_user 
  before_action :set_project, only: [:show, :edit, :update, :delete]
  def index 
    @projects = current_user.projects
  end


  def new 
    @project = Project.new
  end

  def create 
    @project = Project.new(project_params)
    
    if @project.save 
      flash[:notice] = ["Project Created!"]
      redirect_to project_path(@project)
    else
      flash[:errors] = @project.errors.full_messages
      render "new"
    end

  end

  def show

  end

  def edit

  end

  def update

  end

  def delete

  end

  private 
  def set_user 
    if params[:user_id]
    @user = User.find_by_id(:user_id)
    end
  end

  def set_project
    @project = Project.find(params[:id])
  end
  
  def project_params 
    params.require(:project).permit(:title, :goal, partner_ids: [])
  end
end
