#!/usr/bin/env ruby

# Place this file in /root/autoexec.sh

require 'libroute/component'
require_relative 'rungnuplot'

Libroute::Component.run do |options|

  rungnuplot(options)

end
