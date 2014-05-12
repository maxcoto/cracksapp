class GeneralController < ApplicationController

  def index

    @device = Device.find(params[:id])

    @profiles = @device ? Profile.where(device_id: @device.id) : nil

    render :layout => false

  end

end
