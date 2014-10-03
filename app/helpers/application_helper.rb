module ApplicationHelper

  def device_name(device)
    return "No Devices Found" unless device
    name = ""
    name = "#" if device.name == device.number
    name += device.name
  end

  def user_name
    "@" + current_user.email.split('@').first
  end

  def user_picture
    gravatar_id = Digest::MD5.hexdigest(current_user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=100&d=retro"
  end

  def friendly_date(date)
    return "Never" if date == "0"
    datetime = DateTime.strptime(date[0, 10], '%s')
    local_time(datetime)
  end
end
  