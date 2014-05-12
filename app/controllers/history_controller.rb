class HistoryController < ApplicationController

  def index

    device = Device.find(params[:id])

    @histories = device ? Bookmark.where(device_id: device.id) : nil

    render :layout => false

  end

end
