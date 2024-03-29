# encoding: utf-8

module Sinatra
   module BionomiaImg
     module ResponseHelper
 
       def nil_image
         content_type "image/png"
         etag "1x1"
         send_file "system/1x1.png", type: :png
         exit
       end

       def get_image(hex:)
         content_type "image/png"
         etag hex
         send_file "public/#{hex}.png", type: :png
       end

       def save_image(params:, hex:)
         url = CGI.unescapeURIComponent(params[:src])
         uri = URI.parse(URI::Parser.new.escape(url))
         begin
            image = Rszr::Image.load_data(uri.open.read, autorotate: true)
            image.format = "png"
            if params[:grey]
               image.desaturate!
            end
            if params[:width] && params[:height] && params[:width] == params[:height]
               width = [image.width, params[:width].to_i].min
               height = [image.height, params[:height].to_i].min
               image.resize!(width, height, crop: :center)
            elsif params[:width] && params[:height] && params[:width] != params[:height]
               image.resize!(params[:width].to_i, params[:height].to_i, crop: :center)
            elsif params[:width] && !params[:height] && params[:width].to_i < image.width
               image.resize!(params[:width].to_i, :auto)
            elsif params[:height] && !params[:width] && params[:height].to_i < image.height
               image.resize!(:auto, params[:height].to_i)
            end
            image.save("public/#{hex}.png")
            etag hex
            send_file "public/#{hex}.png", type: :png
         rescue Rszr::LoadError => e
            redirect uri.to_s
         rescue
            nil_image
         end
       end

      def flush_image(hex:)
         begin
            FileUtils.rm("public/#{hex}.png")
         rescue
            nil
         end
      end

     end
   end
 end
 