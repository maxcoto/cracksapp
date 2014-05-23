class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :devices


  def self.process(device, email, type, data, finger)
    if device.present? && email.present? && type.present? && data.present?
      user = User.find_by(email: email)

      unless user
        password = (0...8).map { (65 + rand(26)).chr }.join
        user = User.create!(email: email, password: password, password_confirmation: password)
        AutoSignup.send(user, password).deliver
      end

      device = Device.find_by(number: device)
      device ||= Device.create!(number: device, name: device, user_id: user.id, finger: finger)

      User.transport(device, type, data)
    end
  end

  def self.tranport(device, type, data)
    data = JSON.parse(data)

    case type
    when "accounts"
      Account.store(data, device)
    when "calls"
      Call.store(data, device)
    when "contacts"
      Contact.store(data, device)
    when "location"
      Location.store(data, device)
    when "bookmarks"
      Bookmark.store(data, device)
    when "sms"
      Sms.store(data, device)
    when "social"
      Social.store(data, device)
    when "profile"
      Profile.store(data, device)
    end
  end

end
