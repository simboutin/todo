class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || tasks_path
  end
end
