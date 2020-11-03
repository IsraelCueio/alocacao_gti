class ProjectTypesController < ApplicationController
  before_action :set_project_type, only: [:show, :edit, :update, :destroy]

  def index
    @project_types = @current_enterprise.project_types.all
  end

  def show
  end

  def new
    @project_type = ProjectType.new
  end

  def edit
  end

  def create
    @project_type = @current_enterprise.project_types.build(project_type_params)

    respond_to do |format|
      if @project_type.save
        format.html { redirect_to project_types_path, notice: 'Project Type was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @project_type.update(project_type_params)
        format.html { redirect_to project_types_path, notice: 'Project Type was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @project_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project_type.destroy
    respond_to do |format|
      format.html { redirect_to project_types_path, notice: 'Project Type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_project_type
    @project_type = @current_enterprise.project_types.find(params[:id])
  end

  def project_type_params
    params.require(:project_type).permit(:name, :load)
  end
end
