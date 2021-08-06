class ProjectsController < ApplicationController
  before_action :set_user  
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  
  def index
    @projects = @user.projects
  end


  def new 
    @project = Project.new
    
  end

  def create 
    
    @project = Project.create(project_params)
    @project.update(owner_id: @user.id)
    @project.project_features.update(user_id: current_user.id, project_id: @project.id)  
    if @project.save && !@project.project_features.empty?
      flash[:notices] = ["Project Created!"]
      redirect_to project_path(@project.id)
    else
      flash[:errors] = @project.errors.full_messages 
      flash[:errors] << "Needs at least one feature" if @project.project_features.empty?
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
    redirect_to projects_path
  end

  private 

  def set_user 
    @user = current_user  
  end

  def set_project
    @project = Project.find(params[:id])
  end
  
  def project_params 
    params.require(:project).permit(:title, :goal, project_features_attributes: [[:name], [:description]])
  end
####BASICS ONLY!!!!
end
