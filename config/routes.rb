Rails.application.routes.draw do
  root 'todolists#index'
  devise_for :users

  resources :users, only: [:show, :edit, :update]

  resources :todolists do
    resources :tasks do
      put :complete, on: :member
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
