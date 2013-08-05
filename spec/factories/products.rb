# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do

    sequence :title do |n|
      "Product #{n}"
    end
    description "Product Description"
    price "9.99"
    rating 2.0
    image_url "http://ecx.images-amazon.com/images/I/71pTlCgTTrL._SL1500_.jpg"
  end
end
