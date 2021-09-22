Rails.application.routes.draw do

  namespace :admins do
    get 'questions/index'
    get 'questions/show'
  end
  namespace :admins do
    get 'posts/index'
    get 'posts/show'
  end
  namespace :admins do
    get 'users/index'
    get 'users/edit'
  end
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }

  devise_for :users,controllers:{
    registrations: "users/registrations",
    passwords: "users/passwords",
    sessions: "users/sessions"
  }

  scope module: :users do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :users,only:[:show, :edit, :update]do
      get "users/unsubscribe" => "users#unsubscribe"
      patch "users/withdraw" => "users#withdraw"
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :posts do
      resource :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :questions do
      resources :answers, only: [:create, :edit, :update, :destroy] do
        resource :nices, only: [:create, :destroy]
      end
    end

    get   'inquiries'         => 'inquiries#index'     # 入力画面
    post  'inquiries/confirm' => 'inquiries#confirm'   # 確認画面
    post  'inquiries/thanks'  => 'inquiries#thanks'    # 送信完了画面
  end

  namespace :admins do
    root to: "homes#top"
    resources :users,only:[:index, :edit, :update]
    resources :posts,only: [:index,:show,:destroy]
    resources :questions,only: [:index,:show,:destroy]
  end

end
