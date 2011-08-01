require 'rubygems'
require 'sinatra'
require 'active_record'

enable :sessions

current_path = File.expand_path(File.dirname(__FILE__))
$:.unshift("#{current_path}/")

require 'model.rb'

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql",
  :host     => "localhost",
  :database => "to_do_list",
  :username => "root",
  :password => "asdfgh"
)

get '/' do
	redirect '/login'
end

get '/login' do
	erb :login,:layout => false
end

get '/auth/failure' do
		<<-HTML
	404
		HTML
end

post '/login' do
	user= User.find_by_name(params[:username])
	session[:id] = user.id
  if user
		redirect '/home'
	else
		redirect '/auth/failure'
	end
end

require 'controllers/home.rb'
