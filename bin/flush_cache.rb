#!/usr/bin/env ruby
# encoding: utf-8
require File.dirname(File.dirname(__FILE__)) + '/application.rb'

ARGV << '-h' if ARGV.empty?

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: flush_cache.rb"

  opts.on("-a", "--all", "Flush all cached images") do
   options[:all] = true
  end

  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit
  end
end.parse!

if options[:all]
   FileUtils.rm_r(Dir.glob("public/*.png"))
end
