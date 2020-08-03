Rails.application.routes.draw do
  get '/flights/:id', to: 'flights#show'

  get '/passengers/:id', to: 'passengers#show'

  post '/flight_passengers', to: 'flight_passengers#create'
end
