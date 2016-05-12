class User < ActiveRecord::Base
  has_many :messages

  validates :fb_id, presence: true, uniqueness: true
end
