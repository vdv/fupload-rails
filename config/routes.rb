FuploadRails::Engine.routes.draw do
  resources :assets, :only => [:index, :create]
end
