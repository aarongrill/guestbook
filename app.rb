require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/user'
require './models/tweet'
require './models/connection'

set :port, 8080
set :static, true
set :bind, '0.0.0.0'

get '/' do
    erb :index
end

post '/submit_user' do
	@user = User.new(params[:user])
	if @user.save
		redirect '/users'
	else
		"Sorry, there was an error!"
	end
end

get '/create_user' do
	erb :create_user
end

get '/users' do
	@users = User.all
	erb :users
end