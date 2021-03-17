class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :set_projects, only: [:edit, :new]
  before_action :set_positions, only: [:edit, :new]

  # GET /members
  # GET /members.json
  def index
    @q = @current_enterprise.members.ransack(params[:q])
    @members = @q.result.order(load: :desc)
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @development_load = @member.calc_development_load
    @management_load = @member.calc_managing_load
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = @current_enterprise.members.build(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = @current_enterprise.members.find(params[:id])
  end

  def set_projects
    @projects = @current_enterprise.projects
  end

  def set_positions
    @positions = @current_enterprise.positions
  end

  # Only allow a list of trusted parameters through.
  def member_params
    params.require(:member).permit(
      :name, :load, :exit_cycle,
      member_positions_attributes: %i[id position_id _destroy],
      member_projects_attributes: %i[id project_id _destroy],
      manager_projects_attributes: %i[id project_id _destroy]
    )
  end
end
