Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root 'homes#top'
  get "home/about" => "homes#about"
  resources :users, only: [:show, :index, :edit]

  #guestuser機能
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :books, only: [:show, :index, :edit, :create, :new] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

end
