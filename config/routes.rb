Rails.application.routes.draw do
  namespace :teachers_backoffice do
    get 'schedule/index'
    resources :schedules
  end
  get 'subjects/index'
  namespace :teachers_backoffice do
    get 'welcome/index'
  end
  devise_for :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 root to: 'teachers_backoffice/welcome#index'
end
