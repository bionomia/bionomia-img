require 'bundler'
require 'cgi'
require 'digest'
require 'sinatra/base'
require 'open-uri'
require 'optparse'
require 'thin'
require 'require_all'
require 'uri'
require 'rack'
require 'rack/contrib'
require 'rszr'

Encoding.default_internal = Encoding::UTF_8
Encoding.default_external = Encoding::UTF_8

require_all File.join(File.dirname(__FILE__), 'helpers')
require_all File.join(File.dirname(__FILE__), 'routes')
