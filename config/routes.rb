Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :microposts
  resources :users do
    # users/:id/followings
    # users/:id/followers
    member do
      get 'followings'
      get 'followers'
    end
    
    # users/followings
    # users/followers
    # collection do
    #   get 'followings'
    #   get 'followers'
    # end
  end
  
#   resources :photos do
#   member do
#     get 'preview'
#   end
# end
  resources :relationships, only:[:create, :destroy]
end

  