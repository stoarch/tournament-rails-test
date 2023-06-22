require "test_helper"

class TournamentTest < ActiveSupport::TestCase
  def test_tournament_creation_and_play
    teams = Array.new(16) { |i| Team.create(name: "Team #{i + 1}", division: i < 8 ? "A" : "B") }
    tournament = Tournament.new(teams: teams)
    assert tournament.save
    tournament.generate_schedule
    assert_equal 56, tournament.schedule.size # Each division has 8 teams, so there should be 8 choose 2 = 28 matches in each division
    tournament.play_matches
    assert_not_empty tournament.schedule.map(&:winner)
  end
end
