Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users, only: [:index]
  get '/users/:id/posts/new', to: 'posts#new'
  resources :users, only: [:show] do
    resources :posts, only: [:index, :show]
  end
  post '/users/:id/posts/create', to: 'posts#create'
  get 'users/:id/posts/:post_id/comments/new', to: 'comments#new'
  post 'users/:id/posts/:post_id/comments/create', to: 'comments#create'
  post 'users/:id/posts/:post_id/likes/create', to: 'likes#create'

end
