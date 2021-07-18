Rails.application.routes.draw do
  namespace :discipline do
    get '/index', to: 'disciplines#index'
    get '/graph', to: 'disciplines#graph'
    post '/', to: 'disciplines#create'
    put '/:discipline_id', to: 'disciplines#update'
    delete '/:discipline_id', to: 'disciplines#delete'

    scope '/dependency' do
      get '/:discipline_id', to: 'dependencies#show_by_discipline'
      post '/', to: 'dependencies#create'
      delete '/:dependency_id', to: 'dependencies#delete'
    end
  end

  namespace :semester do
    post '/', to: 'semesters#create'
  end

  namespace :student do
    get '/', to: 'students#index'
    get '/recommendation/:student_id', to: 'students#recommendation'
    post '/', to: 'students#create'
  end

  namespace :completed_discipline do
    get '/', to: 'completed_disciplines#index'
    get '/:student_id', to: 'completed_disciplines#show_by_student'
    post '/', to: 'completed_disciplines#create'
  end
end
