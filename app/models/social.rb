class Social < ActiveRecord::Base

  belongs_to :device

  def self.store(data, device)
    data.each do |social|
      c = Social.find_by(device_id: device.id, number: social["id"])
      c ||= Social.create!(
        number: social["id"],
        name: encode(social["accountName"]),
        kind: social["accountType"],
        comments: encode(social["comments"]),
        contact_number: social["contactId"],
        raw_contact_number: social["rawContactId"],
        body: encode(social["text"]),
        timestamp: social["timestamp"],
        sync1: encode(social["sync1"]),
        sync2: encode(social["sync2"]),
        sync3: encode(social["sync3"]),
        sync4: encode(social["sync4"]),
        device_id: device.id
      )
    end
  end

  def encode(str)
    str.force_encoding('Windows-1252').encode('UTF-8')
  end
end
