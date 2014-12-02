class PicsController < ApplicationController

  def index
  end

  def iphone
  	
  end

  def tablet
  	
  end

  def get_uri
    require 'net/http'
    url = URI.parse('http://imageresizerr.herokuapp.com/?url=http://i.kinja-img.com/gawker-media/image/upload/s--OpFMWJzB--/199vu342jcfpwjpg.jpg&width=200&height=200')
    req = Net::HTTP::Get.new(url.to_s)
    @res = Net::HTTP.start(url.host, url.port) {|http| 
     http.request(req)}
   end
 end
