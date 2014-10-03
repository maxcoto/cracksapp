class CallsController < ApplicationController

  before_action :authenticate_user!

  before_action :load_device, :only => :index

	def index
    @calls = @device ? Call.where(device_id: @device.id).order('number DESC').limit(100) : nil

    render :layout => false
  end

end
