class AddDefaultWinsToTeams < ActiveRecord::Migration[7.0]
  def change
    change_column_default :teams, :wins, 0
  end
end
