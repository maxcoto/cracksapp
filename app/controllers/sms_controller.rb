class SmsController < ApplicationController

  before_action :authenticate_user!

  def index
    device = Device.find(params[:id])

    sms = device ? Sms.where(device_id: device.id).select('DISTINCT(address), person') : nil

    @addresses = sms ? sms.map!{ |s| [(s.person || s.address), s.address] } : nil

    @address = @addresses.present? ? @addresses[0][1] : nil

    render :layout => false
  end

  def messages
  	@device = Device.find(params[:id])

  	address = params[:address]

  	@sms = (@device && address) ? Sms.where(device_id: @device.id, address: address).order('date') : nil

  	render :layout => false
  end

end
