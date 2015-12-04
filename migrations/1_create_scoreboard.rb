Sequel.migration do
  up do
    create_table(:team) do
      primary_key :id
      String :name, :null => false
    end
    create_table(:scoreboard) do
      primary_key :id
      foreign_key :home_id, :team, :null => false
      foreign_key :visitor_id, :team, :null => false
      Integer :home_score, :null => false
      Integer :visitor_score, :null => false
      DateTime :date
    end
  end

  down do
    drop_table(:scoreboard)
    drop_table(:team)
  end
end
