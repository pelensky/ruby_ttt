$LOAD_PATH << File.join(File.dirname(__FILE__), "lib")

require 'rubygems'
require File.join(File.dirname(__FILE__), './web/app.rb')

run Web
