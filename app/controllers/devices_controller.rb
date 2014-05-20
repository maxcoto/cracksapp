class DevicesController < ApplicationController

  before_action :authenticate_user!

  def index
    @devices = Device.where(user_id: current_user.id)
    @device = @devices.try(:first)
  end

  def change
  	device = Device.find(params[:id])
  	device.name = params[:name]
  	device.save!

    head :ok
  end

end
