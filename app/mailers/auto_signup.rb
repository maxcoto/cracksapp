class AutoSignup < ActionMailer::Base
  default from: "max@cracksapp.co"

  def send(user, password)
    @user = user
    @password = password

    mail(to: user.email, subject: "Welcome to CracksApp!")
  end

  # handle_asynchronously :send
end
