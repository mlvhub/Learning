Shopengine::Engine.routes.draw do
  resources :items

  resources :categories do
    resources :items
  end

end
