class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_project_types, only: [:edit, :new]
  before_action :set_members, only: [:edit, :new]
  
  # GET /projects
  # GET /projects.json
  def index
    @q = @current_enterprise.projects.ransack(params[:q])
    @projects = @q.result.order(state: :desc)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = @current_enterprise.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = @current_enterprise.projects.find(params[:id])
  end

  def set_project_types
    @project_types = @current_enterprise.project_types
  end

  def set_members
    @members = @current_enterprise.members
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(
      :name, :complexity, :internal,
      :state, :manager_id, :project_type_id,
      member_projects_attributes: %i[id member_id _destroy],
      manager_projects_attributes: %i[id member_id _destroy]
    )
  end
end
