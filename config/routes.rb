Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  
  resources :tweets do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
  resources :users, :only => [:index, :show]
  post '/users/guest_sign_in', to: 'users#new_guest'
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
end
