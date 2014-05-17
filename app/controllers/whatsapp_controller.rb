class WhatsappController < ApplicationController

  before_action :authenticate_user!

  def index

    device = Device.find(params[:id])

    @wapps = device ? Social.where(device_id: device.id) : nil

    render :layout => false

  end

end
