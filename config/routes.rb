Rails.application.routes.draw do
  get 'profiles/new'
  devise_for :users
  devise_scope :user do#トップページをログイン画面に
    root "devise/sessions#new"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :profiles
  get 'messages/new1' => 'messages#new1', as: 'new1_message'
  
  resources :messages
  
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  
  get 'talk_list/:user_id' => 'relationships#talk_list', as: 'talk_list'
  
  
end
