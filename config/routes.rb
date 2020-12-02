Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/ports', to: 'ports#index'
  get '/vehicles', to: 'vehicles#index'
  get '/passengers', to: 'passengers#index'
end
