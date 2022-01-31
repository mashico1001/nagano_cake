Rails.application.routes.draw do
  
  scope module: :public do
    root to: "homes#top"
    get '/about' => "homes#about"
    
    get '/customers/my_page' => "customers#show"
    get '/customers/edit' => "customers#edit"
    patch '/customers' => "customers#update"
    get '/customers/unsubscribe' => "customers#unsubscribe"
    patch '/customers/withdraw' => "customers#withdraw"
    
    delete '/cart_items/destroy_all' => "cart_items#destroy_all"
    
    resources :cart_items, only: [:index, :update, :destroy, :create]
    
    
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    
    
    post '/orders/confirm' => "orders#confirm"
    get '/orders/thanks' => "orders#thanks"
    resources :orders, only: [:index, :new, :create, :show]
    
    resources :items, only: [:index, :show]
    
    devise_for :customers, controllers: {
      sessions: 'public/customers/sessions',
      passwords: 'public/customers/passwords',
      registrations: 'public/customers/registrations'
    }
    
  end
  
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords'
  }

  
  namespace :admin do
    get '/' => "homes#top"
    
    
    resources :items, except: [:destroy]
    get '/items/search' => "items#search"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only:[:update]
  
    
  end
  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
