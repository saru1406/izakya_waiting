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
  get 'search' => 'stores#search'
  get 'customers/my_page'=>'customers#show'
  get 'customers/information/edit'=>'customers#edit'
  patch 'customers/information'=>'customers#update'
  delete 'customers/information'=>'customers#destroy'
  resources :bookmarks, only: [:index]
  resources :reviews, only: [:index]
  resources :review_comments, only: [:index]
  resources :stores, only: [:index, :show] do
    resource :bookmarks, only: [:create, :destroy]
    resources :reviews, only: [:show, :create, :destroy, :edit, :update] do
      resource :favorites, only: [:create, :destroy]
      resources :review_comments, only: [:create, :destroy]
    end
  end
end

namespace :public_store do
  get 'stores/my_page'=>'stores#show'
  get 'stores/information/edit'=>'stores#edit'
  patch 'stores/information'=>'stores#update'
  delete 'stores/information'=>'stores#destroy'
end

namespace :admin do
  resources :stores, only: [:index,:show, :edit, :update, :destroy]
  resources :customers, only: [:index, :show, :edit, :update, :destroy]
  resources :reviews, only: [:index, :destroy]
  resources :review_comments, only: [:index, :destroy]
end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
