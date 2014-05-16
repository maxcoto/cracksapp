class Bookmark < ActiveRecord::Base

  belongs_to :device

  def self.store(data, device)
    data.each do |bookmark|
      c = Bookmark.find_by(device_id: device.id, number: bookmark["id"])
      
      begin
        c ||= Bookmark.create!(
          number: bookmark["id"],
          is_bookmark: bookmark["bookmark"].to_i,
          title: bookmark["title"],
          url: bookmark["url"],
          visits: bookmark["visits"].to_i,
          last_visited: bookmark["date"],
          created: bookmark["created"],
          device_id: device.id
        )
      rescue
        Rails.logger.error "Encoding Problem On Bookmark"
      end
    end
  end

end
