class ContactsController < ApplicationController

  def index

    device = Device.find(params[:id])

    @contacts = device ? Contact.where(device_id: device.id) : nil

    render :layout => false

  end

end
