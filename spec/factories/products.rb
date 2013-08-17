# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do

    sequence :title do |n|
      "Product #{n}"
    end
    description {Forgery(:lorem_ipsum).words(100)}
    price {Forgery(:monetary).money}
    rating {Forgery(:basic).number(:at_least=>1.0, :at_most => 5.0)}
    image_url "http://ecx.images-amazon.com/images/I/71pTlCgTTrL._SL1500_.jpg"
    link "http://amzn.com/B00076SCVG"
    featured false
  end
end
