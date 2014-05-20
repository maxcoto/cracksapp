class Sms < ActiveRecord::Base

  belongs_to :device

  def self.store(data, device)
    data.each do |sms|
      s = Sms.find_by(device_id: device.id, number: sms["id"])

      s ||= Sms.create!(
        number: sms["id"],
        thread_number: sms["thread_number"],
        address: sms["address"],
        person: encode(sms["person"]),
        date: sms["date"],
        protocol: sms["protocol"],
        read: sms["read"],
        status: sms["status"],
        reply_path_present: sms["reply_path_present"],
        subject: encode(sms["subject"]),
        body: encode(sms["body"]),
        service_center: sms["service_center"],
        locked: sms["locked"],
        kind: sms["type"],
        device_id: device.id
      )
    end
  end

  def encode(str)
    str.force_encoding('Windows-1252').encode('UTF-8')
  end
end
