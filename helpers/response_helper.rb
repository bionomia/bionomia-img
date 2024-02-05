# encoding: utf-8

module Sinatra
   module BionomiaImg
     module ResponseHelper
 
       def nil_image
         content_type "image/png"
         send_file "system/1x1.png", type: :png
         exit
       end

       def get_image(hex:)
         content_type "image/png"
         send_file "public/#{hex}.png", type: :png
       end

       def save_image(params:, hex:)
         url = CGI.unescapeURIComponent(params[:src])
         uri = URI.parse(URI::Parser.new.escape(url))
         begin
            image = Rszr::Image.load_data(uri.open.read)
            image.format = "png"
            if params[:width] && params[:height] && params[:width] == params[:height]
               width = [image.width, params[:width].to_i].min
               height = [image.height, params[:height].to_i].min
               image.resize!(width, height, crop: :center)
            elsif params[:width] && params[:width].to_i < image.width && !params[:height]
               image.resize!(params[:width].to_i, :auto)
            elsif params[:height] && params[:height].to_i < image.height && !params[:width]
               image.resize!(:auto, params[:height].to_i)
            end
            image.save("public/#{hex}.png")
            send_file "public/#{hex}.png", type: :png
         rescue Rszr::LoadError => e
            redirect uri.to_s
         rescue
            nil_image
         end
       end

     end
   end
 end
 