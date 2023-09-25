Rails.application.routes.draw do
  resources :categories do 
    resources :producaos, controller: 'category/producaos'
  end

  devise_for :users
  # resources :producaos
  #root :to => "producaos#index"
  root 'producaos#index' 
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
