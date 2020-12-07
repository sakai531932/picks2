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
  
  resources :reviews
  
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  
  get 'talk_list/:user_id' => 'relationships#talk_list', as: 'talk_list'
  
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  
  
end
