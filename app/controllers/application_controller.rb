class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_enterprise
  before_action :enterprise_name

  def set_enterprise
    @current_enterprise = current_user.try(:enterprise)
  end

  def enterprise_name
    @current_enterprise_email = current_user.email
    i=0
    @current_enterprise_name=" "
    while @current_enterprise_email[i]!="@" do
      @current_enterprise_name[i]=@current_enterprise_email[i]
      i = i + 1
    end
  end

end
