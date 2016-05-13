require 'faker'

FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    fb_id { SecureRandom.urlsafe_base64 }
  end
end
