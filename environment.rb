require 'bundler'
require 'cgi'
require 'digest'
require 'sinatra/base'
require 'open-uri'
require 'optparse'
require 'require_all'
require 'uri'
require 'rack'
require 'rack/contrib'
require 'rszr'

OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', -1

require_all File.join(File.dirname(__FILE__), 'helpers')
require_all File.join(File.dirname(__FILE__), 'routes')
