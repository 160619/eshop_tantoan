class AdminController < ActionController::Base
  before_action :authenticate_user!
  def index
  end
end
