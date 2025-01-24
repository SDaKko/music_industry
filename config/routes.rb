Rails.application.routes.draw do
  resources :artists do
    member do
        get 'confirm_destroy'
    end
    
    resources :albums do
      member do
        get 'confirm_destroy'
      end
    end
  end
  root "artists#index"
end