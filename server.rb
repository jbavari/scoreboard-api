require 'sinatra'
require 'sequel'
require 'sinatra/json'
require "sinatra/namespace"

DB = Sequel.connect('postgres://localhost/scoreboard')

scoreboard = DB[:scoreboard]

namespace '/api' do
  namespace 'v1' do
    get '/scores' do
      json :scoreboard => scoreboard.all
    end

    post '/results' do
      data = JSON.parse(request.body.read)
      DB[:scoreboard].insert(
        :home_team => data[:home_team], 
        :visitor_team => data[:visitor_team]
      )
    end
  end
end
