Rails.application.routes.draw do
  devise_for :members
  resources :employees do
    member do
      post :goodjob
    end
  end

  root to: "home#index"

end
