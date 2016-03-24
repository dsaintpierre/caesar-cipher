#!/usr/bin/env ruby

require_relative 'lib/caesarcipher'
require 'byebug'
require 'optparse'

options = {}

options[:decrypt] = false
options[:shift] = 5

option_parser = OptionParser.new do |opts|

  opts.banner = "Usage: cipher.rb [options]"

  opts.on("-d", "--decrypt", "Decrypt an encrypted cipher.") do
    options[:decrypt] = true
  end

  opts.on("-s", "--shift <shift>", "Number of characters to shift your string by. Default is 5.") do |shift|
    options[:shift] = shift
  end
end

option_parser.parse!

ARGV.each do |string|
  unless options[:decrypt]
    Caesar.new(options[:shift].to_i).encode(string)
  else
    Caesar.new(options[:shift].to_i).decode(string)
  end
end
