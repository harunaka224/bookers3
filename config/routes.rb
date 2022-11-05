Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root 'homes#top'
   get "home/about" => "homes#about"
   resources :book, only: [:show, :index, :edit]
   resources :user, only: [:show, :index, :edit]
end
