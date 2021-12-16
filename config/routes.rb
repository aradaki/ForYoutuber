Rails.application.routes.draw do
  devise_for :users
  get 'tags/index'
  resources :youtubers do
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
