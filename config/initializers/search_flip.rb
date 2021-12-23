#SearchFlip::Config[:environment] = Rails.env
#SearchFlip::Config[:base_url] = "http://localhost:9200"
SearchFlip::Config[:environment] = "development"
SearchFlip::Config[:base_url] = "http://127.0.0.1:9200"
if Rails.env == 'production'
  SearchFlip::Config[:base_url] = ENV["BONSAI_URL"]
end
