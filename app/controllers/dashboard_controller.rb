class DashboardController < ApplicationController
  def statistics
    @projects_count = Project.all.count

    @starting_projects_count = Project.where(state: :Starting).count
    @middle_projects_count = Project.where(state: :Middle).count
    @finishing_projects_count = Project.where(state: :Finishing).count
    @support_projects_count = Project.where(state: :Support).count

    @project_types = ProjectType.all
  end

  def projects
    @q = Project.ransack(params[:q])
    @projects = @q.result.order(state: :desc)
  end

  def managers
    managers_ids = ManagerProject.pluck(:member_id).uniq
    @managers = Member.where(id: managers_ids).order(load: :desc)
  end

  def developers
    developers_ids = MemberProject.pluck(:member_id).uniq
    @developers = Member.where(id: developers_ids).order(load: :desc)
  end
end
