class DevicesController < ApplicationController

  def index

    @user = User.first

    @devices = Device.where(user_id: @user.id)

    @device = @devices.first

  end

end
