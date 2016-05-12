require 'faker'

FactoryGirl.define do
  factory :user do
    fname { Faker::Name.first_name }
    lname { Faker::Name.last_name }
    fb_id { SecureRandom.urlsafe_base64 }
  end
end
