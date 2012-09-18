require 'bundler'
Bundler.setup :default
require 'sprockets'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'
  environment.append_path 'assets/misc'
  run environment
end

map '/' do
  run Rack::File.new File.join(File.dirname(__FILE__), 'index.html')
end