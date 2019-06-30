Rails.application.routes.draw do
  devise_for :users
  root 'hotels#index'

  resources :hotels do
    resources :rooms
  end
end
