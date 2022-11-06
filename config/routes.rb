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

root to: 'public/homes#top'

scope module: :public do
  get 'customers/my_page'=>'customers#show'
  get 'customers/information/edit'=>'customers#edit'
  patch 'customers/information'=>'customers#update'
  delete 'customers/information'=>'customers#destroy'
  resources :reviews, only: [:index]
  resources :stores, only: [:index, :show]do
    resources :reviews, only: [:show, :create, :destroy, :edit, :update]do
      resources :review_comments, only: [:create, :destroy]
    end
  end
end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
