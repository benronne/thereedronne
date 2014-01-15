require 'bundler/setup'

require 'sinatra'
require 'haml'
require 'sinatra/activerecord'
require 'rake'
require 'chronic'
require 'rack-flash'

configure(:development) { set :database, 'sqlite3:///thereedronne_db.sqlite3'}

require './models'

enable :sessions
use Rack::Flash, :sweep => true
set :sessions => true

get '/' do
	haml :index
end

get '/accommodations' do
	haml :accommodations
end

get '/activities' do
	haml :activities
end

get '/submit' do
	haml :submit
end

post '/submit' do
	@question = Question.new(name: params['name'], email: params['email'], question_text: params['question_text'], created_at: Time.now)
	if @question.save
		flash[:notice] = "Thanks!  We'll get back to you ASAP."
	else
		flash[:alert] = "Oops. There was a problem with you question."
	end
		redirect "/"
end

get '/questions' do
	@questions = Question.all.reverse
	haml :questions
end