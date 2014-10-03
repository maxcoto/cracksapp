class DevicesController < ApplicationController

  before_action :authenticate_user!

  before_action :load_device, :only => :change

  def index
    @devices = Device.where(user_id: current_user.id)
    @device = @devices.try(:first)
  end

  def change
  	@device.name = params[:name]
  	@device.save!

    head :ok
  end

end
