Rails.application.routes.draw do
  root to: "homes#top"
  get 'homes/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
