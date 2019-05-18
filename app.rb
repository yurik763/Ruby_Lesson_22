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
  @baber = params[:baber]
  @username = params[:username]
  @phone = params[:phone]
  @date_time = params[:date_time]

  @title = "Спасибо!"
  @message = "Уважаемый #{@username}, мы ждём вас #{@date_time}. Ваша парикмахер #{@baber}"

  # запишем в файл то, что ввёл клиент
  f = File.open './public/users.txt', 'a'
  f.write "Имя: #{@username}, телефон: #{@phone}, дата и время: #{@date_time}. Парикмахер: #{@baber}\n"
  f.close

  erb :message
end

get '/contacts' do
  erb :contacts
end

post '/contacts' do
  @email = params[:email]
  @userstext = params[:userstext]

  @title = "Спасибо!"
  @message = "Ваше сообщение принято"

  # запишем в файл то, что ввёл клиент
  f = File.open './public/contacts.txt', 'a'
  f.write "Email: #{@email}, сообщение: #{@userstext}\n"
  f.close

  erb :message
end