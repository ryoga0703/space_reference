Rails.application.routes.draw do
  namespace :admin do
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'tastes/index'
    get 'tastes/edit'
  end
  namespace :admin do
    get 'furnitures/show'
  end
  namespace :admin do
    get 'rooms/index'
    get 'rooms/show'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'furnitures/show'
    get 'furnitures/new'
    get 'furnitures/edit'
  end
  namespace :public do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/unsubscribe'
  end
  # 顧客用
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :public do
    get 'rooms/index'
    get 'rooms/show'
    get 'rooms/new'
    get 'rooms/edit'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
