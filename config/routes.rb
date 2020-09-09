Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get (params1: path, params2: object)
  get '/hello', to: 'first#hello'
  get '/hi', to: 'first#hi'
  get '/me', to: 'users#me'

  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # post 'users', to: 'users#create'
  # delete 'users/:id', to: 'users#destroy'
  # patch 'users/:id', to 'users#update'
  delete '/sessions', to: 'sessions#destroy'

  # 这句话代替上面的所有语句
  resources :users

  resources :records

  # 登录 只有生成和破坏
  resources :sessions, only: [:create]

  # 标签
  resources :tags

  resources :taggings, except: [:update]
end
