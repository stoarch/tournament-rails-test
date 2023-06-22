class Team < ApplicationRecord
  has_many :home_matches, class_name: "Match", foreign_key: "team1_id"
  has_many :away_matches, class_name: "Match", foreign_key: "team2_id"
  has_many :won_matches, class_name: "Match", foreign_key: "winner_id"

  belongs_to :tournament
  has_many :matches

  def matches
    home_matches + away_matches
  end
end
