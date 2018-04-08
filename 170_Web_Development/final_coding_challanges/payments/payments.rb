require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

configure do
  enable :sessions
  set :session_secret, 'secret'
end

before do
  session[:payments] ||= []
end

helpers do
  def format_card(card_num)
    "****-****-****-#{card_num.slice(12, 4)}"
  end
end

def missing_values?(*values)
  values.any? { |val| val.empty? }
end

def missing_values(first_name, last_name, card_num, expiration, ccv)
  result = []
  result << 'First Name' if first_name.empty?
  result << 'Last Name' if last_name.empty?
  result << 'Card Number' if card_num.empty?
  result << 'Expiration Date' if expiration.empty?
  result << 'CCV' if ccv.empty?
  result
end

def valid_card?(card)
  !(card.length == 16)
end

def check_values(first_name, last_name, card_num, expiration, ccv)
  if missing_values?(first_name, last_name, card_num, expiration, ccv)
    missing = missing_values(first_name, last_name, card_num, expiration, ccv)
    "Please enter missing #{missing.join(', ')}"
  elsif valid_card?(card_num)
    'Card Number must have 16 characters'
  end
end

get '/' do
  session.delete :payments
  redirect '/payments/create'
end

get '/payments/create' do
  erb :create_payment
end

post '/payments/create' do
  @first_name = params[:first_name]
  @last_name = params[:last_name]
  @card_num = params[:card_num]
  @expiration = params[:expiration]
  @ccv = params[:ccv]

  error = check_values(@first_name, @last_name, @card_num, @expiration, @ccv)
  if error
    session[:error] = error
    erb :create_payment
  else
    session[:success] = 'Thank you for your payment.'
    payment = {}
    payment[:first_name] = @first_name
    payment[:last_name] = @last_name
    payment[:card_num] = @card_num
    payment[:expiration] = @expiration
    payment[:ccv] = @ccv
    payment[:submitted] = Time.now
    session[:payments] << payment
    redirect '/payed'
  end
end

get '/payed' do
  redirect '/' unless session[:payment]
  erb :payed
end

