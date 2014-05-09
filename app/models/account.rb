class Account < ActiveRecord::Base

	belongs_to :device

  def self.store(data, device)
    data.each do |account|
      a = Account.find_by(device_id: device.id, number: account["id"])
      a ||= Account.create!(
        number: account["id"],
        name: account["name"],
        kind: account["type"],
        device_id: device.id
      )
    end
  end

end
