class Messenger::Client
  include HTTParty
  base_uri 'https://graph.facebook.com/v2.6'
  default_params access_token: ENV['FB_API_ACCESS_TOKEN']
  format :json
  headers 'Content-Type' => 'application/json'

  def send_message(params)
    post('/me/messages', params)
  end

  def get_user(fb_id)
    get("/#{fb_id}/?fields=first_name,last_name,profile_pic,locale,timezone,gender")
  end

  private

  def get(url)
    self.class.get(url)
  end

  def post(url, args)
    self.class.post(url, body: args.to_json)
  end
end
