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
    # @partners = params.require(:partners).permit(:partner_ids)
    
    if @project.save
      
      flash[:notice] = ["Project Created!"]
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

  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private 

  def set_user 
    if params[:user_id]
      params[:user_id] = current_user.id
      @user = User.find_by_id(:user_id)
    end
  end

  def set_project
    @project = Project.find(params[:id])
  end
  
  def project_params 
    params.require(:project).permit(:title, :owner_id, :goal, :partners ,partner_ids:[] )
  end
end
