Rails.application.routes.draw do
  resources :teams
  resources :tournaments do
    collection do
      post :generate
    end
  end
end
