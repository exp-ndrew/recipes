Rails.application.routes.draw do
  match('recipes/', {:via => :get, :to => 'recipes#index'})
  match('recipes/new', {:via => :get, :to => 'recipes#new'})
  match('recipes', {:via => :post, :to => 'recipes#create'})
end
