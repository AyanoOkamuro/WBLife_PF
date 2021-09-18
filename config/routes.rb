Rails.application.routes.draw do
  # devise_for :users
  devise_for :users,controllers:{
    registrations: "users/registrations",
    passwords: "users/passwords",
    sessions: "users/sessions"
  }

  # devise_scope :users do
  #   get "users/sign_up", :to => "users/registrations#new"
  #   post "users", :to => "users/registrations#create"
  #   get "users/sign_in", :to => "users/sessions#new"
  #   post "users/sign_in", :to => "users/sessions#create"
  #   delete "users/sign_out", :to => "users/sessions#destroy"
  # end


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
    end
    resources :questions
  end


end
