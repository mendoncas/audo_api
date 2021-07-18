Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :discipline do
    get '/', to: 'disciplines#index'
    get '/graph', to: 'disciplines#graph'
    post '/', to: 'disciplines#create'
    post '/dependency', to: 'dependencies#create'
  end

  namespace :semester do
    post '/', to: 'semesters#create'
  end

  namespace :student do
    get '/', to: 'students#index'
    post '/', to: 'students#create'
  end

  namespace :completed_discipline do
    get '/', to: 'completed_disciplines#index'
    post '/', to: 'completed_disciplines#create'
  end
end
