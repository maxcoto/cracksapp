class DevicesController < ApplicationController

  def index

    @user = User.first

    @devices = Device.where(user_id: @user.id)

    @device = @devices.first

    @profiles = @device ? Profile.where(device_id: @device.id) : nil

  end

end
