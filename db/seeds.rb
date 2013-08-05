require 'factory_girl_rails'

if Product.first.nil?
  10.times do 
    FactoryGirl.create(:product)
  end
end

if User.find_by_email("estsauver@gmail.com").nil?
  FactoryGirl.create(:user,
                     :email => "estsauver@gmail.com", 
                     :password => "password", 
                     admin: true)
end


