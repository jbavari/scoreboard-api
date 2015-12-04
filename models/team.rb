# require 'json'
require 'sequel/model'
DB = Sequel.connect('postgres://localhost/scoreboard')
module ScoreboardApi
  class Team < Sequel::Model(:team)
    # Built-in format support when loading the plugin
    # plugin :serialization, :json, :permissions
    # serialize_attributes :json, :name
    
  end
end
