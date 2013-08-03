class User < ActiveRecord::Base
include Clearance::User

  def admin?
    self.email == "estsauver@gmail.com"
  end
end
