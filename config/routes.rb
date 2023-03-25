Rails.application.routes.draw do
  resources :employees do
    member do
      post :goodjob
    end
  end
end
