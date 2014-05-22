class SmsController < ApplicationController

  before_action :authenticate_user!

  def index
    device = Device.find(params[:id])

    @addresses = device ? Sms.where(device_id: device.id).select('DISTINCT(address), person') : nil

    @addresses.map! do |address|
      if address.person.empty?
        query_str = address.address.split(//).last(6).join
        contact = Contact.where("phones like ?", "%#{query_str}%").first
        address.person = contact.nil? ? address.address : contact.name
      end

      [address.person, address.address]
    end

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
