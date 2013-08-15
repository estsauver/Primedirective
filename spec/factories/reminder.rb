FactoryGirl.define do
  factory :reminder do
    user
    event "It's a party!"
    product
    date {13.days.from_now}
  end
end
