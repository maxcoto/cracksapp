class Bookmark < ActiveRecord::Base

  belongs_to :device

  def self.store(data, device)
    data.each do |bookmark|
      c = Bookmark.find_by(device_id: device.id, number: bookmark["id"])

      c ||= Bookmark.create!(
        number: bookmark["id"],
        is_bookmark: bookmark["bookmark"].to_i,
        title: encode(bookmark["title"]),
        url: bookmark["url"],
        visits: bookmark["visits"].to_i,
        last_visited: bookmark["date"],
        created: bookmark["created"],
        device_id: device.id
      )
    end
  end

  def self.encode(str)
    str.to_s.force_encoding('Windows-1252').encode('UTF-8')
  end
end
