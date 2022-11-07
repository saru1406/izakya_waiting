Rails.application.routes.draw do

 # 顧客用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 店舗用
devise_for :stores,skip: [:passwords], controllers: {
  registrations: "public_store/registrations",
  sessions: 'public_store/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

#ゲスト用
devise_scope :customer do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

root to: 'public/homes#top'

scope module: :public do
  get 'customers/my_page'=>'customers#show'
  get 'customers/information/edit'=>'customers#edit'
  patch 'customers/information'=>'customers#update'
  delete 'customers/information'=>'customers#destroy'
  resources :reviews, only: [:index]
  resources :review_comments, only: [:index]
  resources :stores, only: [:index, :show] do
    resources :reviews, only: [:show, :create, :destroy, :edit, :update] do
      resources :review_comments, only: [:create, :destroy]
    end
  end
end

namespace :public_store do
  get 'stores/my_page'=>'stores#show'
  resources :stores, only: [:edit, :update]
end

namespace :admin do
  resources :stores, only: [:index, :edit]
  resources :customers, only: [:index, :edit]do
    resources :reviews, only: [:index, :destroy]
    resources :review_comments, only: [:index, :destroy]
  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
