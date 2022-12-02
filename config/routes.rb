Rails.application.routes.draw do
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root 'homes#top'
   get "home/about" => "homes#about"
   post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
   
   resources :books, only: [:show, :index, :edit, :create, :new]
   resources :users, only: [:show, :index, :edit]
end
