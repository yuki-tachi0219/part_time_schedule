Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :administrators, controllers: {
    sessions: 'administrators/sessions'
  }
  devise_for :employees, controllers: {
    sessions: 'employees/sessions'
  }
  namespace :employee do
    resources :attendance_requests
    resources :absence_requests
    resources :notifications, only: [:index]
    resources :employees
    resources :schedules, only: [:index, :edit, :update, :destroy] do
        resources :absence_requests, only: [:new, :create]
    end
  end

  namespace :administrator do
    resources :notifications, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
