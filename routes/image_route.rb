# encoding: utf-8

module Sinatra
   module BionomiaImg
      module ImageRoute

         def self.registered(app)
            app.get '/' do
               nil_image if !params[:src]
               hex = Digest::MD5.hexdigest(params.to_s)
               if File.exist?(File.join("public", "#{hex}.png"))
                  get_image(hex: hex)
               else
                  save_image(params: params, hex: hex)
               end
            end
         end

      end
   end
 end
 