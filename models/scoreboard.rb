require_relative "./db"

module ScoreboardApi
  class Scoreboard < Sequel::Model(:scoreboard)
    one_to_many :team
  end
end
