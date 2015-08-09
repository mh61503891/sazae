Rails.application.routes.draw do
  resources :houses, only: [:index, :show] do
    resources :comments, only: [] do
      member do
        post :like, format: :json
      end
      collection do
        post :create, format: :js
      end
    end
  end

  root 'welcome#index'
end
