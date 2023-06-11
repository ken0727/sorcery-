Rails.application.routes.draw do
  resources :posts
  resources :users
  
  root 'sessions#new' # ログイン画面のコントローラーとアクションを指定
  get 'login' => 'sessions#new', :as => :login
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
