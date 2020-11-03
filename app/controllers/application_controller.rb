class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_enterprise

  def set_enterprise
    @current_enterprise = current_user.try(:enterprise)
  end
end
