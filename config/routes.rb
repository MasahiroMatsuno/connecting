Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  resources :tweets do
    resources :comments, only: :create
  end
  resources :users, only: :show
end
