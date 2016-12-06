class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
skip_before_filter :verify_authenticity_token
  respond_to :html

  def index
    @projects = Project.order('status_id asc')
    respond_with(@projects)
  end

  def show
    respond_with(@project)
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.save
    respond_with(@project)
  end

  def update
    @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :content, :category_id, :start_datetime, :end_datetime, :status_id)
    end
end
