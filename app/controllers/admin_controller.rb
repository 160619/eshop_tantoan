class AdminController < ActionController::Base
  before_action :authenticate_user!
  layout 'application'

  def index
  end
end
