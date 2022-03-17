Rails.application.routes.draw do
  root 'items#index'

  resources :orders, :path => "commande"

  resources :items_in_carts, only: [:create, :destroy]
  
  devise_for :users, :path => "utilisateur"
  
  resources :items, :path => "chat" do
    resources :images, only: [:create]
    get ":id" => :show, as: "chatons"
  end
  
  resources :users, :path => "utilisateur", except: [:index]  do
    resources :carts, :path => "panier"
  end

end
