class DashboardController < ApplicationController
  def index
    @projects = Project.all
    @members = Member.all
  end
end
