class UploadController < ApplicationController

	def index
    device  = params[:device]
    email   = params[:email]
    type    = params[:type]
    data    = params[:data]
    finger  = params[:finger]

    User.delay.process(device, email, type, data, finger)

    head :ok
  end

end