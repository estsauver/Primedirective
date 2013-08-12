class User < ActiveRecord::Base
  include Clearance::User
  has_many :reminders

  def admin?
    self.email == "estsauver@gmail.com"
  end
end
