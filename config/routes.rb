Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :administrators, controllers: {
    sessions: 'administrators/sessions'
  }
  devise_for :employees, controllers: {
    sessions: 'employees/sessions'
  }

  resources :employees
  resources :attendance_requests
  resources :schedules
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
