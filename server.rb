require "rubygems"
require 'sinatra'
require 'sinatra/reloader'
require 'coffee-script'

app_root = File.join File.dirname(__FILE__)
set :lock, true
set :public_folder, Proc.new { app_root }

get '/' do
  File.read File.join(app_root, 'index.html')
end

get '*.js' do
  coffee File.read(File.join(app_root, "#{params[:splat].first}.coffee"))
end