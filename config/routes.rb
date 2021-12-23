Rails.application.routes.draw do
  
  scope module: :public do
    devise_for :customers, controllers: {
      sessions: 'public/customers/sessions',
      passwords: 'public/customers/passwords',
      registrations: 'public/customers/registrations'
    }
    get '/' => "homes#top"
    get '/about' => "homes#about"
  end
  
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords'
  }

  
  namespace :admin do
    get '/' => "homes#top"
    
    
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  
    
  end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
