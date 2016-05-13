FactoryGirl.define do
  factory :message do
    conversation nil
    fb_id SecureRandom.urlsafe_base64
    text nil
    attachments nil
    question nil
    answer_option nil
  end
end
