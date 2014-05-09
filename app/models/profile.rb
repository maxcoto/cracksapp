class Profile < ActiveRecord::Base

  belongs_to :device

  def self.store(data, device)
    data.each do |profile|
      s = Profile.find_by(device_id: device.id, key: sms["key"])
      s ||= Profile.create!(
        key: profile["key"],
        value: profile["value"],
        device_id: device.id
      )
    end
  end

end
