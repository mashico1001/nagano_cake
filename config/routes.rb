Rails.application.routes.draw do
  

  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords'
  }
  
  namespace :admin do
    get '/' => "homes#top"
    
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
  
    
  end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
