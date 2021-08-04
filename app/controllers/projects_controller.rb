class ProjectsController < ApplicationController
  before_action :set_user  
  before_action  :set_partners, only: [:create]
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  
  def index
    
    @projects = @user.projects
  end


  def new 
    @project = Project.new
    
    # @partner_options = User.name_search(name: params[:query])
    
  end

  def create 
    @project = Project.create(project_params)
    
    byebug
    # @project = Project.create
    # @project.partners = project_params[:partners]
    @project.user_id = current_user
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
    @user = current_user
  end

  def set_project
    @project = Project.find(params[:id])
  end
  
  def project_params 
    params.require(:project).permit(:title, :user_id, :goal , :partner_ids => [] )
  end

  def set_user_id
    
  end
  
  def set_partners
   @partners= Project.set_partners(params[:partner_ids])
  end
####BASICS ONLY!!!!
end
