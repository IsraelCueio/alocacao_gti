class DashboardController < ApplicationController
  def index
    @projects = Project.all
    managers_ids = Project.all.pluck(:manager_id).uniq
    @managers = Member.where(id: managers_ids)
  end
end
