Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  api_version(:module => "V1", :path => {:value => "v1"}) do
    resources :phones

    resources :contacts do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'
  
      resource :phones, only: [:show]
      resource :phones, only: [:show], path: 'relationships/phones'
  
      resource :phone, only: [:update, :create, :destroy]
      resource :phone, only: [:update, :create, :destroy], path: 'relationships/phones'
  
      resource :address, only: [:show,:update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
    end
  
    resources :kinds
  end

  api_version(:module => "V2", :path => {:value => "v2"}) do
    resources :phones

    resources :contacts do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'
  
      resource :phones, only: [:show]
      resource :phones, only: [:show], path: 'relationships/phones'
  
      resource :phone, only: [:update, :create, :destroy]
      resource :phone, only: [:update, :create, :destroy], path: 'relationships/phones'
  
      resource :address, only: [:show,:update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
    end
  
    resources :kinds
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
