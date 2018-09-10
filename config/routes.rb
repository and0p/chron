Rails.application.routes.draw do

  get '/orders/:id', :to => 'orders#show'
  get '/orders', :to => 'orders#index'
  post '/orders', :to => 'orders#create'

  # namespace :api, :defaults => {:format => :json} do
  #   namespace :v1 do
  #     resources :orders
  #   end
  # end

end
