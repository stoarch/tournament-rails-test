require "test_helper"

class MatchTest < ActiveSupport::TestCase
  def test_match_creation_and_play
    team1 = Team.create(name: "Team 1", division: "A")
    team2 = Team.create(name: "Team 2", division: "A")
    match = Match.new(team1: team1, team2: team2)
    assert match.save
    match.play_match
    assert_not_nil match.winner
  end
end
