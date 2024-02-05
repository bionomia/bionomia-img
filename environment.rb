require 'bundler'
require 'digest'
require 'sinatra/base'
require 'sinatra/multi_route'
require 'config'
require 'open-uri'
require 'thin'
require 'require_all'
require 'uri'
require 'net/http'
require 'rack'
require 'rack/contrib'
require 'rack/protection'
require 'faraday/typhoeus'
require 'rszr'

Encoding.default_internal = Encoding::UTF_8
Encoding.default_external = Encoding::UTF_8

require_all File.join(File.dirname(__FILE__), 'helpers')
require_all File.join(File.dirname(__FILE__), 'routes')
