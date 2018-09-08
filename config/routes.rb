Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users

  resources :users do
    resources :bios, only:[:new, :create, :show]
  end
  
  resources :posts, except:[:create] do
    # scope "posts/:posts_id", as: "posts" do
    resources :comments, only: [:new, :create]
    # end
  end

  post '/posts/:user_id', to: 'posts#create', as: 'new_user_post'

=begin
/users/user_id/
/users/user_id/posts   <---> ? unnecessary

/users/user_id/posts/post_id/     shows a specific post of the user and its associated comments

/users/user_id/posts/post_id/comment/commet_id

=end


end
