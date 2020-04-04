Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  get 'session/new'
  get 'users/new'

  root 'tests#index'
  resources :contacts, only: [:new, :create]
  resources :badges, only: :index

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: [:show, :update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :badges
    resources :categories, only: [:new, :create]
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end

    resources :gists, only: :index
    end
  end
end
