class Location < ActiveRecord::Base

  belongs_to :device

  def self.store(data, device)
    Location.create!(
      date: data["time"],
      accuracy: data["accuracy"],
      latitude: data["latitude"],
      longitude: data["longitude"],
      device_id: device.id
    )
  end

end
