class WhatsappController < ApplicationController

  def index

    device = Device.find(params[:id])

    @wapps = device ? Social.where(device_id: device.id) : nil

    render :layout => false

  end

end
