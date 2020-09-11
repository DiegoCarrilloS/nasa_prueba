require "uri"
require "net/http"
require 'json'


def request(url1, api_key)
    full_url = "#{url1}api_key=#{api_key}"
    url = URI(full_url)

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    body = JSON.parse response.read_body
    return(body)

end


url_curiosity = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&"
url_opportunity = "https://api.nasa.gov/mars-photos/api/v1/rovers/opportunity/photos?sol=1000&"
url_spirit = "https://api.nasa.gov/mars-photos/api/v1/rovers/spirit/photos?sol=1000&"
api_key = "9zeOm3k53oc9dW1ZUrFK1EqlYzc9sPWkqSBAaPr4"

r_curiosity = request(url_curiosity, api_key)
r_opportunity = request(url_opportunity, api_key)
r_spirit = request(url_spirit, api_key)


output_curiosity = {}
i1 = 0
r_curiosity["photos"].each do |hash|
    hash.each do |k1, v1|
        if k1 == "img_src"
            output_curiosity["key#{i1}"] = v1
            i1 += 1
        end
    end
end

output_opportunity = {}
i2 = 0
r_opportunity["photos"].each do |hash|
    hash.each do |k2, v2|
        if k2 == "img_src"
            output_opportunity["key#{i2}"] = v2
            i2 += 1
        end
    end
end

output_spirit = {}
i3 = 0
r_spirit["photos"].each do |hash|
    hash.each do |k3, v3|
        if k3 == "img_src"
            output_spirit["key#{i3}"] = v3
            i3 += 1
        end
    end
end

curiosity_invert = output_curiosity.invert
opportunity_invert = output_opportunity.invert
spirit_invert = output_spirit.invert

merge1 = curiosity_invert.merge(opportunity_invert)
merge_final = merge1.merge(spirit_invert)
all_photos = merge_final.invert


def buid_web_page(hash1)
    head = '<!doctype html>
        <html lang="en">
        <head>
        <title>Title</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        </head>
        <body>
        <ul>'

        body = ""
        hash1.each do |key, value|
            body+= "<li><img src=\'#{value}\'></li>"
        end

        foot = '</ul>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        </body>
    </html>'
    total = head+body+foot
    File.write('./index.html', total)
    return total
end

buid_web_page(all_photos)

