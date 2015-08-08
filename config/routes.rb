Rails.application.routes.draw do
  resources :houses, only: [:index, :show]

  root 'welcome#index'
end
