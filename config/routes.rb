Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :comments, only:[:new, :create]
  resources :items do
    resources :orders, only:[:index,:new,:create] do
      resources :addresses, only:[:new, :create]
    end
  end
end
