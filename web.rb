require 'rubygems'
#require 'sinatra'
require 'active_record'


require 'Web/model.rb'

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql",
  :host     => "localhost",
  :database => "to_do_list",
  :username => "root",
  :password => "asdfgh"
)

