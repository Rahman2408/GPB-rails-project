class ProjectsController < ApplicationController
  before_action :set_user  
  before_action :set_project_groups, only: [:index]
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def new 
    @project = Project.new
    @project.project_features.build
  end

  def create 
    @project = Project.new(project_params)
    @project.owner_id = @user.id 
    @project.project_features.update(user_id: current_user.id, project_id: @project.id) 
    if @project.save
      flash[:notices] = ["Project Successfully Created!"]
      redirect_to project_path(@project.id)
    else
      flash[:errors] = @project.errors.full_messages 
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @project.update(title: project_params[:title], goal: project_params[:goal])
    if @project.save
      flash[:notices] = ["Project Successfully Updated!"]
      redirect_to project_path(@project.id)
    else
      flash[:errors] = @project.errors.full_messages 
      render :new
    end
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
    params.require(:project).permit(:title, :goal, :project_features_attributes => [:name, :description])
  end

  def set_project_groups
    @projects = Project.all.select { |p| p.owner_id == current_user.id}
    @helping_projects = Project.helping_projects(current_user.id).uniq
    @other_projects = Project.other_projects(current_user.id).uniq
  end
end
