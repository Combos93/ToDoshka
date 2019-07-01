Rails.application.routes.draw do
  root 'todolists#index'
  devise_for :users

  resources :users, only: [:show, :edit, :update]

  resources :todolists do
    post :show, on: :member

    resources :tasks do
      put :complete, on: :member
    end
  end
end
