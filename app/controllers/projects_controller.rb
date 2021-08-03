class ProjectsController < ApplicationController
  before_action :set_user 
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  def index
    @projects = current_user.projects
  end


  def new 
    @project = Project.new
    @partners = User.search(params[:query]).where.not(id: current_user.id)  
  end

  def create 
    @project = Project.new(project_params)
    # @project = Project.create
    # @project.partners = project_params[:partners]
  byebug
    
    if @project.save
      
      flash[:notice] = ["Project Created!"]
      redirect_to user_project_path(user_id: current_user.id, id: @project.id)
    else

      render :new
    end

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy
    @project.destroy
    redirect_to user_projects_path
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
    params.require(:project).permit(:title, :goal, :user_id , partners:[])
  end
end
