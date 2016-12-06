require 'addressable/uri'
require 'rest-client'

def index_users
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users/?val1=val1&val2=val2.html'
    ).to_s

    puts RestClient.get(url)
end

index_users
