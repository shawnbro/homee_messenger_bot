# Homee Backend Developer Challenge
#### New User Onboarding Facebook Messenger Bot
#### created by Shawn Broukhim
##### Getting Started:

- Follow the steps outlined here(https://developers.facebook.com/docs/messenger-platform/quickstart)
  - the API endpoint for all webhooks from facebook is `/api/v1/fb_auth`
  - the Webhooks which are required are `messaging_postbacks` and `messages`.  No need for `message_deliveries` or `messaging_optins`
  - the following `ENV` variables should be added to your machine:
      - `ENV['FB_API_VERIFY_TOKEN']` which is the verify token you wrote when you first registered the app (step 2 on this page: https://developers.facebook.com/docs/messenger-platform/quickstart)
      - `ENV['FB_API_ACCESS_TOKEN']` which is the API access token used for all Facebook API requests
- `git clone` this repo
- `bundle install; rake db:create; rake db:migrate; rake db:seed; rails s;`
- start messaging from the Facbeook page!
- To view user conversations: navigate to the `/api/v1/users/#{user_id}` endpoint
