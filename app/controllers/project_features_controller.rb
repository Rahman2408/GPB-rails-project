class ProjectFeaturesController < ApplicationController
before_action :set_user , :set_project
before_action :set_feature, only: [:edit, :update, :destroy, :show]
skip_before_action :set_project, only: [:update]

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
    @feature.update(feature_params)
      if @feature.save 
        flash[:notice] = ["Feature Updated!"]
        redirect_to project_feature_path(project_id: @feature.project_id, id: @feature.id)
      else
        flash[:errors] = @feature.errors.full_messages
        render "edit"
      end
  end

  def destroy
    @feature.destroy
    redirect_to project_path(@project)
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

  def set_feature
    @feature = ProjectFeature.find(params[:id])
  end
end