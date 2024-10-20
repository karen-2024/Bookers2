Rails.application.routes.draw do
  
  devise_for :users
  root to: "homes#top"
  
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:create, :show, :index, :edit, :update]
  
  get '/homes/about' => 'homes#about', as: 'about'
  
end
