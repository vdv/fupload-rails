FuploadRails::Engine.routes.draw do
  resources :uploads, :only => [:index, :create]
end
