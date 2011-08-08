require 'rubygems'
require 'sinatra'
require 'active_record'

enable :sessions

current_path = File.expand_path(File.dirname(__FILE__))
$:.unshift("#{current_path}/")

require 'lib/utils.rb'
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

get '/logout' do
	session[:logged_in] = false
	redirect '/login'
end

get '/auth/failure' do
		<<-HTML
	404
		HTML
end

post '/login' do
	user= User.find_by_name(params[:username])
	redirect '/auth/failure' if user.nil?
	session[:id] = user.id if user
  if user.name + '123' == params[:password]
    session[:logged_in]= true
		redirect '/home'
	else
    session[:logged_in]= false
		redirect '/auth/failure'
	end
end

require 'controllers/home.rb'
