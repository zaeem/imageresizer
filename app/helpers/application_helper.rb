module ApplicationHelper

  def get_uri (image_path)
  	require 'net/http'
    url = URI.parse("http://imageresizerr.herokuapp.com/?url="+image_path+"&width=200&height=200")
    req = Net::HTTP::Get.new(url.to_s)
    http = ""
    @res = Net::HTTP.start(url.host, url.port) {|http|  http.request(req).body}
   end

end
