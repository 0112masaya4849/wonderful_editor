Rails.application.routes.draw do
  resources :article_likes
  resources :comments

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for "User", at: "auth"
      resources :article
    end
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
