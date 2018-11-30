Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'base#root'
  
  namespace :api, defaults: { format: :json } do
    resource :session, only: [:create, :show, :destroy]
    resources :users, only: [:new, :create, :edit, :update, :destroy]
    resources :restaurants, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :edit, :update, :show, :destroy]
    resources :order_groups, only: [:new, :create, :edit, :update, :show, :destroy]
  end
  
  get '*path', to: 'base#root';
end
