class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation

  def text
    json_data[0]['messaging'][0]['message']['text']
  end
end
