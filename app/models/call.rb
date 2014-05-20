class Call < ActiveRecord::Base

  belongs_to :device

  def self.store(data, device)
    data.each do |call|
      c = Call.find_by(device_id: device.id, number: call["id"])
      c ||= Call.create!(
        number: call["id"],
        name: encode(call["cachedName"]),
        date: call["date"],
        duration: call["duration"],
        phone: call["number"],
        kind: call["type"],
        device_id: device.id
      )
    end
  end

  def self.encode(str)
    str.to_s.force_encoding('Windows-1252').encode('UTF-8')
  end

end
