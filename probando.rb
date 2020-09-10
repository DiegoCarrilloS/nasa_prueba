require 'uri'

def request(url1, api_key)
    c= "#{url1}#{api_key}"
    puts c


end

#request(blabbermouth, advertise)

def url_with_api_key(url, api_key)
    "#{url}api_key=#{api_key}"
  
end
  
d =url_with_api_key 'https://example.com', 'foobarbaz'
puts d