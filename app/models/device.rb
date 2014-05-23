class Device < ActiveRecord::Base

  belongs_to :user

  has_many :account
  has_many :bookmark
  has_many :call
  has_many :contact
  has_many :profile
  has_many :sms

end
