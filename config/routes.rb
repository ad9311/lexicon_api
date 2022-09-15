Rails.application.routes.draw do
  root 'home#index'

  resources :home, only: %i[index]
  resources :languages, except: %i[index show]
  resources :dictionaries, except: %i[index]
  resources :entries, except: %i[index show]
end
