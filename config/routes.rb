Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root "columns#index"
  resources :columns
  resources :users
  resources :categories
  resources :products do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
    end
  end
  resources :groups, only: [:index, :new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end
end
