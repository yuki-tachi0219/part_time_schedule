Rails.application.routes.draw do
  devise_for :administrators, controllers: {
    sessions: 'administrators/sessions'
  }
  devise_for :employees, controllers: {
    sessions: 'employees/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
