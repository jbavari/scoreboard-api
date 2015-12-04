require "bundler"
require 'sequel'
require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/namespace'

require './models/scoreboard'
require './models/team'

Bundler.require

# $DB = Sequel.connect('postgres://localhost/scoreboard')
# scoreboard = $DB[:scoreboard]

module ScoreboardApi
  class App < Sinatra::Application
    register Sinatra::Namespace
    configure do
      disable :method_override
      disable :static

      set :sessions,
          :httponly     => true,
          :secure       => production?,
          :expire_after => 31557600, # 1 year
          :secret       => ENV["SESSION_SECRET"]
    end

    use Rack::Deflater

    get '/hi' do
      json :hi => 'there'
    end

    namespace '/api/v1' do
      get '/hi' do
        json :hi => 'again'
      end
     
      get '/scores' do
        json :scoreboard => ScoreboardApi::Scoreboard.all
      end

      get '/teams' do
        json :teams => ScoreboardApi::Team.to_json
      end

      post '/results' do
        data = JSON.parse(request.body.read)
        puts "We got data #{data}"
        # $DB[:scoreboard].insert(
        #   :home_team => data[:home_team], 
        #   :visitor_team => data[:visitor_team]
        # )
      end
    end
  end
end
