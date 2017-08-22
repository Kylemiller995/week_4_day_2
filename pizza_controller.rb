require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza.rb')


#index route
get '/pizzas' do
  @pizzas = Pizza.all()
  erb(:index)
end

#new route
get '/pizzas/new' do
  erb(:new)
end

#show route
get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb(:show)
end

post '/pizzas' do
  @pizza = Pizza.new(params)
  @pizza.save
  erb(:create)
end

post '/pizzas/:id/delete' do
  @pizza = Pizza.find(params[:id])
  @pizza.delete
  erb(:delete)
  redirect to "/pizzas"
end

get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params[:id])
  erb(:edit)
end

post 'pizzas/:id' do
  @pizza = Pizza.new(params)
  @pizza.update
  redirect to "/pizzas"
end
