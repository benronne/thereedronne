require 'bundler/setup'

require 'sinatra'
require 'haml'
require 'sinatra/activerecord'
require 'rake'
require 'chronic'
require 'rack-flash'

configure (:development) { set :database, 'sqlite3:///thereedronne_db.sqlite3'}

require './models'

get '/' do
	haml :index
end

get '/accommodations' do
	haml :accommodations
end

get '/activies' do
	haml :activies
end

get '/submit' do
	haml :submit
end

get '/questions' do
	haml :questions
end