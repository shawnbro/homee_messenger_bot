require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should validate_presence_of :fb_id }
  it { should validate_presence_of :conversation_id }
end
