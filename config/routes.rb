Rails.application.routes.draw do
  
  get 'profiles/new'
  
  #devise_for :users
  #devise_scope :user do#トップページをログイン画面に
    #root "devise/sessions#new"
  #end
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
  
  root to: 'pages#index'
  
  get 'pages/index2' => 'pages#index2', as: 'index2_page'
  
  get 'pages/done' => 'pages#done', as: 'done_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :profiles
  
  post 'profiles/purchase' => 'profiles#purchase', as: 'purchase_profile'
  
  get 'messages/new1' => 'messages#new1', as: 'new1_message'
  
  get 'messages/index1' => 'messages#index1', as: 'index1_messages'
  
  resources :messages
  
  resources :reviews
  
  get 'follow/:id' => 'relationships#follow', as: 'follow'
  
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  
  get 'talk_list/:user_id' => 'relationships#talk_list', as: 'talk_list'
  
  
end
