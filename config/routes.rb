Rails.application.routes.draw do

  get '/orders', :to => 'orders#index'

  # namespace :api, :defaults => {:format => :json} do
  #   namespace :v1 do
  #     resources :orders
  #   end
  # end

end
