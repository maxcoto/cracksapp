class HistoryController < ApplicationController

  before_action :authenticate_user!

  before_action :load_device, :only => :index

  def index
    @histories = @device ? Bookmark.where(device_id: @device.id).order('last_visited DESC') : nil

    render :layout => false
  end

end
