class MyConstraint
  def initialize

  end
  def matches?(request)

  end
end



Rails.application.routes.draw do
  root 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  resources :articles do
    resources :comments
  end
  # get: url, to: redirect
  # match 'url'. to: xxx, via: xx
  # root to xxx, 

  # get 'path', to 'controller#action', as 'name', via: [:get, :post]
  # namespace :admin do
  #   resources :articles
  # end

  # get 'photos/:id', to: 'photos#show', id: /[a-z]/
  # get 'photos/:id', to: 'photos#show', constraints: {id: /[a-z]/}
  # advanced constraints
  # constraints: MyConstraint.new
  # 
  # draw(:admin) # config/routs/admin.rb
  # rails routes
  

  resources :articles, module: 'admin'

  # middleware
  # concern :commentable do
    
  # end
  # defaults format: :json do
    
  # end
end
