Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root 'homes#top'
   resource :book, only: [:show, :index, :edit]
   resource :user, only: [:show, :index, :edit]
end
