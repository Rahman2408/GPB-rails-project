class ProjectFeaturesController < ApplicationController
before_action :set_user , :set_project

  def index
    @features = @project.project_features
  end


  def new 
    @feature = ProjectFeature.new 
  end

  def create 
    @feature = ProjectFeature.create(feature_params)
    @feature.update(user_id: @user.id, project_id: @project.id)
    
    if @feature.save 
      flash[:notice] = ["Feature Added!"]
      redirect_to project_feature_path(project_id: @project.id, id: @feature.id)
    else
      flash[:errors] = @feature.errors.full_messages
      render "new"
    end
  end

  def show
  end

  def edit 
  end

  def update
  end

  def destroy

  end

  private 
  
  def feature_params
    params.require(:project_feature).permit(:name, :description)
  end

  def set_user 
    @user = current_user  
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end