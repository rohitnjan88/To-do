require 'rubygems'
require 'sinatra'

get '/home' do
  locals = { 
		:user => User.find(session[:id]),
 		:to_do => ToDo.where(:user_id=>session[:id])
	}
	erb :'home',:locals => locals
end

