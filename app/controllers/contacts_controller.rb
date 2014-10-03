class ContactsController < ApplicationController

  before_action :authenticate_user!

  before_action :load_device, :only => :index

  def index
    @contacts = @device ? Contact.where(device_id: @device.id).order(:name) : nil

    render :layout => false
  end

end
