#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
  erb :about
end

get '/visit' do
  erb :visit
end

post '/visit' do
  # user_name, phone, date_time
  @username = params[:username]
  @phone = params[:phone]
  @date_time = params[:date_time]

  @title = "Спасибо!"
  @message = "Уважаемый #{@username}, мы ждём вас #{@date_time}"

  # запишем в файл то, что ввёл клиент
  f = File.open './public/users.txt', 'a'
  f.write "Имя: #{@username}, телефон: #{@phone}, дата и время: #{@date_time}.\n"
  f.close

  erb :message
end

get '/contacts' do
  erb :contacts
end