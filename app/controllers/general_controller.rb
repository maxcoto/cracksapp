class GeneralController < ApplicationController

  before_action :authenticate_user!

  def index

    @device = Device.find(params[:id])

    @profiles = @device ? Profile.where(device_id: @device.id) : nil

    render :layout => false

  end

end
