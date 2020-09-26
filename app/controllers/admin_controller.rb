class AdminController < ActionController::Base
  before_action :authenticate_user!
  before_action :admin_verify!
  layout 'application'

  def index
  end

  private
    def admin_verify!
      return true if current_user.role == "admin"
      redirect_to root_path, alert: 'you do not admin '
  end
end
