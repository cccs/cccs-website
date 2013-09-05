require 'csv'
require 'net/http'
require 'net/https'


def redirect_url(resp)
  if resp['location'].nil?
    resp.body.match(/<a href=\"([^>]+)\">/i)[1]
  else
    resp['location']
  end
end

def follow_url(url, maxdepth=5)
  if maxdepth>0
    begin
      uri = URI.parse(url)
      resp = if url.start_with?('https://')
               https = Net::HTTP.new(uri.host, uri.port)
               https.use_ssl = true
               https.verify_mode = OpenSSL::SSL::VERIFY_NONE
               request = Net::HTTP::Get.new(uri.request_uri)
               https.request(request)
             else
               Net::HTTP.get_response(uri)
             end
    rescue
      puts "Network error getting #{url}"
      return url
    end
    if resp.kind_of?(Net::HTTPRedirection)
      follow_url(redirect_url(resp), maxdepth-1)
    else
      url
    end
  else
    url
  end
end


if ! File.exists?(ARGV[0])
  puts('File not found')
  raise Exception
end

CSV.open(ARGV[1], 'wb') do |out|
  CSV.foreach(ARGV[0]) do |row|
    # puts "id=#{row[0]} time=#{row[1]} nick=#{row[2]} --> #{row[3]}"
    tweet = row[3]
    links = tweet.scan(/https?:\/\/[^ ]*[^ .);:!?]/)
    links.each { |link|
      # puts "Resolving #{link}"
      newlink = follow_url(link)
      if (newlink!=link)
        # puts "#{link} --> #{newlink}"
        tweet.gsub!(link, newlink)
      end
    }
    row[3] = tweet
    out << row
  end
end

