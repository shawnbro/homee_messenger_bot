class MessengerClient
  include HTTParty
  base_uri 'https://graph.facebook.com/v2.6'
  default_params access_token: 'EAAWNAHAdo04BADCzdrh3OK06LNlXrmoOUitAM7k6CoVBBRpedqhofnBd1IP7QH9loMhcZAkXI01T15bWxYqj2NsaZCN4mmbtrdwaOt6rHZAvFrV2rNGc7ocOZCBVw9s0nGzSKD65m7ZCNGm64p55ASAqx1kEs9p2vbF7jVgoiuwZDZD'
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
