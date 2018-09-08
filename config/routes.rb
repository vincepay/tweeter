Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users

  resources :users do
    resources :bios, only:[:new, :create, :show]
  end
  
  resources :posts do
    resources :comments, only: [:new, :create]
  end


end
