Rails.application.routes.draw do
  
  resources :favorites
  resources :profiles
  resources :posts
  resources :favorites, only: [:create, :destroy]
  resources :posts do
    resources :comments
  end

  devise_for :users, controllers: { sessions: "users/sessions" }
  root 'posts#index' 

end
