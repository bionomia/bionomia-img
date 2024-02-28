# encoding: utf-8

module Sinatra
   module BionomiaImg
      module ImageRoute

         def self.registered(app)
            app.get '/' do
               nil_image if !params[:src]
               flush = params.delete("flush")
               hex = Digest::MD5.hexdigest(params.to_s)
               if flush
                  flush_image(hex: hex)
               end
               if File.exist?(File.join("public", "#{hex}.png"))
                  get_image(hex: hex)
               else
                  save_image(params: params, hex: hex)
               end
            end

            app.delete '/etag/:hex' do
               if params[:hex] && 
                  params[:hex].length == 32 && 
                  File.exist?(File.join("public", "#{params[:hex]}.png"))
                     flush_image(hex: params[:hex])
                     halt 410, "File is gone"
               else
                  halt 404, "File not found"
               end
            end

            app.delete '/etags' do
               params[:etags].split("\r\n").each do |hex|
                  if hex.length == 32 && 
                     File.exist?(File.join("public", "#{hex}.png"))
                        flush_image(hex: hex)
                  end
               end
               halt 410, "Files are gone"
            end
         end

      end
   end
 end
 