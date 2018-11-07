Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'base#root'
  
  namespace :api, defaults: { format: :json } do
    resource :session, only: [:create, :show, :destroy]
    resources :restaurants, only: [:index, :new, :create, :update]
  end
  
  get '*path', to: 'base#root';
end
