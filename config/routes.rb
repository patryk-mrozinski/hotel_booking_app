Rails.application.routes.draw do
  root 'hotels#index'
  devise_for :users

  resources :hotels, only: %i[index show] do
    resources :rooms, only: %i[index show]
  end

  # authenticate :company, lambda { |u| u.company? } do

 namespace :company do
   resources :hotels do
     resources :rooms
   end
 end
end
