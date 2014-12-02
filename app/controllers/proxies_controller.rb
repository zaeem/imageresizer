class ProxiesController < ApplicationController
  def index
		require 'rubygems'
		require 'RMagick'
		require "open-uri"
		@url = params[:url]
    unless params[:width] && params[:height]
      render text: @url
    end
		@width = params[:width]
		@height = params[:height]
		if @url.index('//').present?
			@image_name = @url.split('//')[1]
		else
			@image_name = @url
		end
		@image_name = "#{@width}*#{@height}-" + @image_name.gsub!('/','_').split('?')[0]
    @filepath = "#{Rails.root}/public/resized/"+@image_name
    if !File.exist?(@filepath)

			image = Magick::ImageList.new  
			urlimage = open(@url)
			img = image.from_blob(urlimage.read)
			resized = image.resize_to_fit(@width, @height)
			@filepath = "#{Rails.root}/public/resized/"+@image_name
			resized.write(@filepath)
		end
    
    render text: set_file_path
  end

  
  def set_file_path
  	@file_path = url_for.split('proxies')[0] + @filepath.split('public/')[1]
  end
end
