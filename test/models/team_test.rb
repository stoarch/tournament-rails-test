require "test_helper"

class TeamTest < ActiveSupport::TestCase
  def test_team_creation
    team = Team.new(name: "Team 1", division: "A")
    assert team.save
    assert_equal "Team 1", team.name
    assert_equal "A", team.division
  end
end
