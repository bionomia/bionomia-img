# encoding: utf-8

module Sinatra
   module BionomiaImg
     module ResponseHelper
 
       def nil_image
         content_type "image/png"
         send_file "public/1x1.png", type: :png
         exit
       end
 
       #TODO: cache response somehow
       def cached_image(hex:)
         content_type "image/png"
         send_file "public/#{hex}.png", type: :png
         exit
       end

       def cache_image(params:, hex:)
         unescaped = CGI.unescapeURIComponent(params[:src])
         uri = URI.parse(unescaped.gsub(" ", "%20"))
         begin
            Tempfile.create do |f|
               f.binmode
               f << uri.open.read
               image = Rszr::Image.load(f.path)
               image.format = "png"
               if params[:width] && params[:height] && params[:width] == params[:height]
                  width = params[:width].to_i
                  height = params[:height].to_i
                  image.resize!(width, height, crop: :center)
               elsif params[:width] && !params[:height]
                  image.resize!(params[:width].to_i, :auto)
               elsif params[:height] && !params[:width]
                  image.resize!(:auto, params[:height].to_i)
               end
               image.save("public/#{hex}.png")
               send_file "public/#{hex}.png", type: :png
            end
         rescue OpenURI::HTTPError => e
            nil_image
         end
         
       end

     end
   end
 end
 