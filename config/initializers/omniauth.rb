Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '939803272271-816pnbdgsbr7oul0gsrhivj61vdm6no1.apps.googleusercontent.com', 'BRTjoVFw0iOiw4kNd4MQl_U8'
  
  provider :facebook, '715108101937122', 'c489303235f37e19b07aca848183cf24'
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end


