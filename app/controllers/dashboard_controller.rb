class DashboardController < ApplicationController
  def index
    @projects = Project.all
    managers_ids = ManagerProject.pluck(:member_id).uniq
    @managers = Member.where(id: managers_ids)
  end
end
