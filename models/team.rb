require_relative './db'

# DB = Sequel.connect('postgres://localhost/scoreboard')
module ScoreboardApi
  class Team < Sequel::Model(:team)
    # Built-in format support when loading the plugin
    # plugin :serialization, :json, :permissions
    # serialize_attributes :json, :name
    plugin :json_serializer

    def self.insert_if_not_exists(name)
      puts "Looking up -> #{name}"
      dataset = self.where(name: name)
      if dataset.first.nil?
        rec_id = self.insert(name: name)
      else
        rec_id = dataset.first.id
      end

      rec_id
    end
    
  end
end
