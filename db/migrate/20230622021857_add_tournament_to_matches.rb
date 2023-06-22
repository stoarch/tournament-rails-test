class AddTournamentToMatches < ActiveRecord::Migration[7.0]
  def change
    add_reference :matches, :tournament, null: false, foreign_key: true
  end
end
