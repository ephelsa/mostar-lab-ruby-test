Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :users do
    post '/sign-in', to: 'users#sign_in'
    post '/login', to: 'users#login'
    get '/favorites', to: 'users#favourites_index'
    post '/favorites', to: 'users#favourites_add_movie'
  end

  resource :movies do
    get '/', to: 'movies#index'
    get '/:id', to: 'movies#show'
  end
end
