Rails.application.routes.draw do

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

  end

end
