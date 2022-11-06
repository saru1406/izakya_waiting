Rails.application.routes.draw do
  namespace :public do
    get 'review_comments/index'
  end
  namespace :public do
    get 'stores/index'
    get 'stores/show'
  end
  namespace :public do
    get 'reviews/show'
  end
  namespace :public_store do
    get 'stores/index'
    get 'stores/show'
  end
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
  resources :stores, only: [:index, :show]do
    resources :reviews, only: [:show, :create, :destroy]do
      resources :review_comments, only: [:create, :destroy]
    end    
  end
end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
