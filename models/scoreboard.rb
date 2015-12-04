require 'sequel/model'
DB = Sequel.connect('postgres://localhost/scoreboard')
module ScoreboardApi
  class Scoreboard < Sequel::Model(:scoreboard)
    one_to_many :team
  end
end
