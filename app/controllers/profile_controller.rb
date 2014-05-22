class ProfileController < ApplicationController

  def index
    @count = Device.where(user_id: current_user.id).count

    render :layout => false
  end

end
