class ApplicationController < ActionController::Base
  #protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token

  def load_device
    @device = Device.where(:id => params[:id], :user => current_user).first
  end
end
