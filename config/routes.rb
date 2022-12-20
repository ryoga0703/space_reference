Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  # 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root :to =>"homes#top"
    get "about"=>"homes#about"

    get 'rooms/individual' => 'rooms#individual'
    resources :rooms, only: [:new,:create,:show,:index,:edit,:update,:destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:edit, :update, :create, :destroy]
    end

    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :customers, only: [:index,:show,:edit,:update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    resources :furnitures, only: [:show,:new,:create,:edit,:update,:destroy]
  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  get "admin"=>'admin/homes#top'

  namespace :admin do
    resources :rooms, only: [:index,:show,:destroy] do
      resources :comments, only: [:destroy]
    end

    resources :furnitures, only: [:show,:destroy]

    resources :tastes, only: [:index,:create,:edit,:update,:destroy]

    resources :customers, only: [:show,:edit,:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
