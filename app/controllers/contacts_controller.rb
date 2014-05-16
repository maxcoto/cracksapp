class ContactsController < ApplicationController

  def index

    device = Device.find(params[:id])

    @contacts = device ? Contact.where(device_id: device.id).order(:name) : nil

    render :layout => false

  end

end
