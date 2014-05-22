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
    default_url = "#{root_url}images/guest.png"
    gravatar_id = Digest::MD5.hexdigest(current_user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=100&d=#{CGI.escape(default_url)}"
  end

  def friendly_date(date)
    build_date(date) + " UTC"
  end

  def build_date(date)
    return "Never" if date == "0"

    datetime = DateTime.strptime(date[0, 10], '%s')
    date = datetime.strftime('%Y-%m-%d')
    time = datetime.strftime('%H:%M')

    if datetime.to_date == Date.today
      "Today #{time}"
    elsif datetime.to_date == Date.yesterday
      "Yesterday #{time}"
    else
      "#{date} #{time}"
    end
  end

end
  