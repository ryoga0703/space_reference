Rails.application.routes.draw do
  # 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do

    root :to =>"homes#top"
    get "about"=>"homes#about"

    get 'rooms/index'
    get 'rooms/show'
    get 'rooms/new'
    get 'rooms/edit'

    get 'furnitures/show'
    get 'furnitures/new'
    get 'furnitures/edit'

    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/unsubscribe'
  end


  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'customers/show'
    get 'customers/edit'

    get 'tastes/index'
    get 'tastes/edit'

    get 'furnitures/show'

    get 'rooms/index'
    get 'rooms/show'

    get 'homes/top'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
