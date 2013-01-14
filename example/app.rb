require 'sinatra'
require 'sinatra-sextant'

desc "Sample routing"
get '/' do
  content_type :html
  "<a href=\"/sinatra/routes\">check it out</a>"
end

desc "Sample routing ver 2"
params :id, "ID for foo bar"
get '/:id' do
  "wow"
end
