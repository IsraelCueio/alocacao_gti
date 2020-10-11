class DashboardController < ApplicationController
  def index
    @projects = Project.all
    @members = Member.all
    @managers = Member.joins(:positions).where(positions: { manager: true })
  end
end
