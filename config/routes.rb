Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'base#root'
  
  resource :session, only: [:create, :show, :destroy]
  
  get '*path', to: 'base#root';
end
