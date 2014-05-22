class LocationController < ApplicationController

  before_action :authenticate_user!

  def index
  	render :layout => false
  end

  def fetch
  	device = Device.find(params[:id])

  	date = params[:date].split('-')
  	y = date[0].to_i
  	m = date[1].to_i
  	d = date[2].to_i
  	date = DateTime.new(y, m, d).utc

  	finish = date + 1.day - 1.second

  	start  = date.to_time.to_i.to_s + '000'
  	finish = finish.to_time.to_i.to_s + '000'

  	query = "device_id = ? AND date >= ? AND date <= ?"
  	where = [query, device.id, start, finish]

    @locations = device ? Location.where(where).order('date DESC') : nil

    render :layout => false
  end

end
