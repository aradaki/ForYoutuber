Rails.application.routes.draw do
  root 'youtubers#index'
  devise_for :users
devise_scope :user do
  get "user/:id", :to => "users/registrations#detail"
  get "signup", :to => "users/registrations#new"
  get "login", :to => "users/sessions#new"
  get "logout", :to => "users/sessions#destroy"
  get "/mypage" => "users#mypage"
  get "/users/edit" => "users#edit"
  patch "/users" => "users#update"
end
 #get 'tags/index'
  resources :tags, only: [:index, :create]
  resources :styles
  get "/about" => "homes#about"
  resources :users
  resources :youtubers do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
