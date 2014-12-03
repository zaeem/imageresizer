module ApplicationHelper

  def get_uri (image_path, width, height)
  	require 'net/http'
    url = URI.parse("http://imageresizerr.herokuapp.com/?url="+image_path+"&width="+width.to_s+"&height="+height.to_s+"")
    req = Net::HTTP::Get.new(url.to_s)
    http = ""
    @res = Net::HTTP.start(url.host, url.port) {|http|  http.request(req).body}
   end

end
