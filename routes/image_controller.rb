# encoding: utf-8

module Sinatra
   module BionomiaImg
      module ImageController

      def self.registered(app)

         app.get '/' do
            nil_image if !params[:src]
            hex = Digest::MD5.hexdigest(params.to_s)
            cached_image(hex: hex) if File.exist?(File.join("public", "#{hex}.png"))
            cache_image(params: params, hex: hex)
         end

      end

      end
   end
 end
 