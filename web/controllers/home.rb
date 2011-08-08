require 'rubygems'
require 'sinatra'

get '/home' do
  login_required
  puts session[:id] 
  locals = {
		:user => User.find(session[:id]),
 		:to_do => ToDo.where(:user_id=>session[:id])
	}
	erb :'home',:locals => locals
end

get '/create_a_new_todo' do
  login_required
	erb :'create_a_new_todo'
end

post '/create_a_new_todo' do
	new_todo =  ToDo.new
  new_todo.user_id = session[:id]
	new_todo.description = params[:description]
	new_todo.priority = params[:priority]
	new_todo.created_on = Time.now
	new_todo.save
	redirect '/home'
end
