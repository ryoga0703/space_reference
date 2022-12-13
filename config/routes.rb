Rails.application.routes.draw do
  # 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root :to =>"homes#top"
    get "about"=>"homes#about"

    resources :rooms, only: [:index,:show,:new,:edit,:update,:destroy]

    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :customers, only: [:index,:show,:edit,:update]

    resources :furnitures, only: [:show,:new,:create,:edit,:update,:destroy]
  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  get "admin"=>'admin/homes#top'

  namespace :admin do
    resources :rooms, only: [:index,:show,:destroy]

    resources :furnitures, only: [:show,:destroy]

    resources :tastes, only: [:index,:create,:edit,:update,:destroy]

    resources :customers, only: [:show,:edit,:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
