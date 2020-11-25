Rails.application.routes.draw do
  root 'profiles#index'
  get 'profiles/new'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :profiles
end
