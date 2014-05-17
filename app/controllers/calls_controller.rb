class CallsController < ApplicationController

  before_action :authenticate_user!

	def index

    device = Device.find(params[:id])

    @calls = device ? Call.where(device_id: device.id).order('number DESC').limit(100) : nil

    render :layout => false

  end

end
