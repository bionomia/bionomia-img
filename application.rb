#!/usr/bin/env ruby
# encoding: utf-8

require File.dirname(__FILE__) + '/environment.rb'

class BIONOMIAIMG < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :public_folder, 'public'
  set :show_exceptions, false

  register Sinatra::MultiRoute
  register Config
  register Sinatra::BionomiaImg::ImageController

  helpers Sinatra::BionomiaImg::ResponseHelper

  error Sinatra::NotFound do
    nil_image
  end

  error do
    nil_image
  end

  run! if app_file == $0
end
