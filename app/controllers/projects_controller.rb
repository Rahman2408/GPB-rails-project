class ProjectsController < ApplicationController
  before_action :set_user  
  before_action :set_project_groups, only: [:index]
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  
  def index
  
  end


  def new 
    @project = Project.new
    
  end

  def create 
    
    @project = Project.new(project_params)
    @project.update(owner_id: @user.id)
    @project.project_features.update(user_id: current_user.id, project_id: @project.id)  
    if @project.save && !@project.project_features.empty?
      flash[:notices] = ["Project Created!"]
      redirect_to project_path(@project.id)
    else
      flash[:errors] = @project.errors.full_messages 
      flash[:errors] << "Any good idea should feature something! Add one below!" if @project.project_features.empty?
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

    def set_project_groups
      @projects = Project.where_mine(current_user.id).uniq
      @helping_projects = Project.helping_projects(current_user.id).uniq
      @other_projects = Project.other_projects(current_user.id).uniq
    end
end
