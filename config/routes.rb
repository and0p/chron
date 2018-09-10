Rails.application.routes.draw do

  get '/orders/:id', :to => 'orders#show'
  get '/orders', :to => 'orders#index'
  post '/orders', :to => 'orders#create'

  get '/', :to => 'orders#index'

end
