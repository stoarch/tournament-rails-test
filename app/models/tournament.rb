class Tournament < ApplicationRecord
  has_many :matches
  has_many :teams
  has_many :team1s, through: :matches, source: :team1
  has_many :team2s, through: :matches, source: :team2

  after_initialize :setup

  attr :schedule

  def setup
    @schedule ||= []
  end

  def generate_schedule
    return if teams.nil?

    # Split teams into two divisions
    divisions = { "A" => [], "B" => [] }
    teams.shuffle.each_with_index do |team, index|
      divisions[index % 2 == 0 ? "A" : "B"] << team
    end

    # For each division, schedule each team to play against every other team
    divisions.each do |division, teams|
      teams.combination(2).each do |team1, team2|
        schedule << Match.new(team1: team1, team2: team2, tournament: self)
      end
    end
  end

  def play_matches
    schedule.each do |match|
      match.play_match
    end
  end
end
