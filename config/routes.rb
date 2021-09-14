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
    get "users/:id/edit" => "users#edit"
    get "users/:id" => "users#show"
    patch "users/:id" => "users#update"
    get 'homes/about'
    resource :users,only:[:edit,:update]
    get "users/unsubscribe" => "users#unsubscribe"
    patch "users/withdraw" => "users#withdraw"
  end





#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
