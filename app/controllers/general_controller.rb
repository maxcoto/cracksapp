class GeneralController < ApplicationController

  before_action :authenticate_user!

  before_action :load_device, :only => :index

  def index
    @owner = @device ? Profile.where(device_id: @device.id) : nil
    @owner = @owner.find_by_key("display_name").try(:value) || "-"

    build_data

    render :layout => false
  end

  def build_data
    options = ["device_id = ? and created_at > ?", @device.id, 24.hours.ago]
    @data   = {}

    calls     = Call.where(options)
    incoming  = calls.where(:kind => 'incoming').count
    outgoing  = calls.where(:kind => 'outgoing').count
    missed    = calls.where(:kind => 'missed').count
    @data[:calls] = { :all => calls.count, :incoming => incoming, :outgoing => outgoing, :missed => missed }

    sms     = Sms.where(options)
    inbox   = sms.where(:kind => 'inbox').count
    outbox  = sms.where(:kind => 'outbox').count
    @data[:sms] = { :all => sms.count, :inbox => inbox, :outbox => outbox }

    contacts = Contact.where(options)
    contacts_count = contacts.count

    if contacts_count > 5
      contacts[5].name = 'etc...'
      contacts = contacts[0..5]
    end

    @data[:contacts] = { :all => contacts_count, :names => contacts.map(&:name).compact }

    @data[:location] = Location.where(options).last
  end

end
