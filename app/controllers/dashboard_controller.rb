class DashboardController < ApplicationController
  before_action :set_project_types, only: :projects

  def statistics
    @projects_count = @current_enterprise.projects.count

    @starting_projects_count = @current_enterprise.projects.where(state: :Starting).count
    @middle_projects_count = @current_enterprise.projects.where(state: :Middle).count
    @finishing_projects_count = @current_enterprise.projects.where(state: :Finishing).count
    @support_projects_count = @current_enterprise.projects.where(state: :Support).count

    @project_types = @current_enterprise.project_types
  end

  def projects
    @q = @current_enterprise.projects.ransack(params[:q])
    @projects = @q.result.order(state: :desc)
  end

  def managers
    managers_ids = ManagerProject.includes(:member).where(members: {enterprise_id: @current_enterprise.id}).pluck(:member_id).uniq
    @managers = Member.where(id: managers_ids).order(load: :desc)
  end

  def developers
    developers_ids = MemberProject.includes(:member).where(members: {enterprise_id: @current_enterprise.id}).pluck(:member_id).uniq
    @developers = Member.where(id: developers_ids).order(load: :desc)
  end

  private
 
  def set_project_types
    @project_types = @current_enterprise.project_types
  end
end
