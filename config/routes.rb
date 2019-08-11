Rails.application.routes.draw do
  root 'hotels#index'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :hotels, only: %i[index show] do
    resources :rooms, only: %i[index show]
  end

 namespace :for_company do
   resources :companies do
     resources :hotels, only: :index
   end

   resources :hotels, except: :index do
     resources :rooms, only: :index
   end

   resources :rooms, except: :index
 end

 resources :rooms, only: %i[index show] do
   resources :reservations
 end
  namespace :api do
    namespace :v1 do
      resources :countries, only: [] do
        resources :cities, only: :index
      end
    end
  end

end
