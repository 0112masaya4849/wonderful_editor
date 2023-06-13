Rails.application.routes.draw do
  resources :article_likes
  resources :comments

  namespace :api do
    namespace :v1 do
      resources :articles
    end
  end


  mount_devise_token_auth_for "User", at: "auth"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
