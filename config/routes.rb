Rails.application.routes.draw do
  root 'rooms#index'
  devise_for :users

  resources :hotels, only: %i[index show] do
    resources :rooms, only: %i[index show]
  end

  # authenticate :company, lambda { |u| u.company? } do

 namespace :for_company do
   resources :companies
   resources :hotels
   resources :rooms
 end
end
