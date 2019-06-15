Rails.application.routes.draw do
  root 'tasks#index'

  resources :tasks do
    put :complete, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
