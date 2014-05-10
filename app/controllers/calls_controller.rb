class CallsController < ApplicationController

	def index

    device = Device.find(params[:id])

    @calls = device ? Call.where(device_id: device.id) : nil

    render :layout => false

  end

end
