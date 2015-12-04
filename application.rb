require "bundler"
require "sinatra/base"
require "sinatra/json"
require "sinatra/namespace"

require "./models/scoreboard"
require "./models/team"

Bundler.require

# $DB = Sequel.connect("postgres://localhost/scoreboard")
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
          :expire_after => 31_557_600, # 1 year
          :secret       => ENV["SESSION_SECRET"]
    end

    use Rack::Deflater

    namespace "/api/v1" do
      get "/scores" do
        json :scoreboard => Scoreboard.all
      end

      get "/teams" do
        json :teams => Team.all
      end

      post "/results" do
        home_team = params[:home_team]
        visitor_team = params[:visitor_team]
        home_score = params[:home_score]
        visitor_score = params[:visitor_score]
        home_team_id = Team.insert_if_not_exists(home_team)
        visitor_team_id = Team.insert_if_not_exists(visitor_team)

        puts "Home_team_id #{home_team_id}"
        puts "visitor_team_id #{visitor_team_id}"

        status = true

        begin
          scoreboard = Scoreboard.insert(
            :date => DateTime.now,
            :home_id => home_team_id,
            :home_score => home_score,
            :visitor_id => visitor_team_id,
            :visitor_score => visitor_score
          )
        rescue
          status = false
        end

        json :payload => {:status => status, :scoreboard_id => scoreboard}
      end
    end
  end
end
