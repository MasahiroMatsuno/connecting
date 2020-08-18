Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#index'
  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' 
  resources :homes, only: :index
  resources :tweets do
    resources :comments, only: :create
    collection do
      get 'search'
    end
    resources :likes, only: [:create, :destroy]
  end
  resources :users
  post '/users/guest_sign_in', to: 'users#new_guest'
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
end
