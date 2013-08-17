class Product < ActiveRecord::Base
  default_scope { order("featured DESC, created_at DESC")}
  has_many :reminders
end
