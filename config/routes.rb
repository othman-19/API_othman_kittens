Rails.application.routes.draw do
  resources :kittens
  root "kittens#index", as: :root
end
