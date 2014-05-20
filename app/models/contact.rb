class Contact < ActiveRecord::Base

  belongs_to :device

  def self.store(data, device)
    data.each do |contact|
      c = Contact.find_by(device_id: device.id, number: contact["id"])

      c ||= Contact.create!(
        number: contact["id"],
        name: encode(contact["name"]),
        phones: contact["phones"].to_s,
        device_id: device.id
      )
    end
  end

  def self.encode(str)
    str.to_s.force_encoding('Windows-1252').encode('UTF-8')
  end

end
