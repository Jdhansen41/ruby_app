Rails.application.routes.draw do
    root to: 'articles#index' #Tells app to start on our articles index page
    resources :articles do
        resources :comments
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
