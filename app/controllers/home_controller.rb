class HomeController < ApplicationController

  def index

    redirect_to devices_path if current_user

  end

end
