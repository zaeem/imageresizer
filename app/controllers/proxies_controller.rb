class ProxiesController < ApplicationController
  def index
		require 'rubygems'
		require 'RMagick'
		require "open-uri"
  		@url = params[:url]
  		@width = params[:width]
  		@height = params[:height]
  		if @url.index('//').present?
  			@image_name = @url.split('//')[1]
  		else
  			@image_name = @url
  		end
  		@image_name = "#{@width}*#{@height}-" + @image_name.gsub!('/','_').split('?')[0]
  		@filepath = search_files
  		if @filepath.nil?
        logger.info("---------------------------------file path nil-------------------------------------------------------")
  			image = Magick::ImageList.new  
  			urlimage = open(@url)
  			img = image.from_blob(urlimage.read)
  			resized = image.resize_to_fit(@width, @height)
  			@filepath = "#{Rails.root}/public/resized/"+@image_name
        
  			resized.write(@filepath)
  		end

  		set_file_path
    # save_image

  end
  def search_files
  	filepath = nil
		files = Dir.glob("#{Rails.root}/public/resized/*")

  	files.each do |f|

			u = f.split('/') 

			if u.index(@image_name) 

				filepath = f

			end 
  	end
  	filepath
  end
  def set_file_path
  	@file_path = url_for.split('proxies')[0] + @filepath.split('public/')[1]
  end
  # def save_image
  #   File file = new File(@url);
  #   FileInputStream fis = new FileInputStream(file);
  #   PreparedStatement ps = conn.prepareStatement("INSERT INTO images VALUES (?, ?)");
  #   ps.setString(1, file.getName());
  #   ps.setBinaryStream(2, fis, file.length());
  #   ps.executeUpdate();
  #   ps.close();
  #   fis.close();
  # end

end
