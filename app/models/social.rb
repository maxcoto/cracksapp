class Social < ActiveRecord::Base

  belongs_to :device

  def self.store(data, device)
    data.each do |social|
      c = Social.find_by(device_id: device.id, number: social["id"])
      c ||= Social.create!(
        number: social["id"],
        name: social["accountName"],
        kind: social["accountType"],
        comments: social["comments"],
        contact_number: social["contactId"],
        raw_contact_number: social["rawContactId"],
        body: social["text"],
        timestamp: social["timestamp"],
        sync1: social["sync1"],
        sync2: social["sync2"],
        sync3: social["sync3"],
        sync4: social["sync4"],
        device_id: device.id
      )
    end
  end

end
