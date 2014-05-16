module ContactsHelper

  def phone_list(phones)
    list = JSON.parse(phones).join(' / ')
    list == "" ? "no number" : list
  end

end
