class Match < ApplicationRecord
  belongs_to :team1, class_name: "Team"
  belongs_to :team2, class_name: "Team"
  belongs_to :winner, class_name: "Team", optional: true
  belongs_to :tournament

  def play_match
    # Randomly select a winner
    self.winner = [team1, team2].sample

    # Increment the winner's win count
    self.winner.wins ||= 0
    self.winner.wins += 1

    # Save the changes
    self.save!
    self.winner.save!
  end
end
