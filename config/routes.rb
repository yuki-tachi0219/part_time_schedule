Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :administrators, controllers: {
    sessions: 'administrators/sessions'
  }
  devise_for :employees, controllers: {
    sessions: 'employees/sessions'
  }
  resources :administrators do
    member do
      get :show_employees
      get :edit_employees
      put :update_employees
      delete :destroy_emoployees
    end
    collection do
      get :new_employees
      post :create_employees
    end
  end

  resources :employees
  resources :attendance_requests
  resources :schedules
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
