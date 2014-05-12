class SmsController < ApplicationController

  def index

    device = Device.find(params[:id])

    @sms = device ? Sms.where(device_id: device.id) : nil

    render :layout => false

  end

end
