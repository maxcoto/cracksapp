module ApplicationHelper

  def device_name
    name = ""
    name = "#" if @device.name == @device.number
    name += @device.name
  end

  def user_name
    "@" + @user.email.split('@').first
  end

  def user_picture
    default_url = "#{root_url}images/guest.png"
    gravatar_id = Digest::MD5.hexdigest(@user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
  end

end
  