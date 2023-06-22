class TournamentsController < ApplicationController
  def index
    @tournament = Tournament.last
  end

  def generate
    @tournament = Tournament.create # Create a new tournament and save it to the database
    @tournament.teams = Team.all    # Associate the tournament with all existing teams
    @tournament.generate_schedule   # Generate the tournament schedule
    @tournament.play_matches        # Play the matches

    redirect_to tournaments_path
  end

  def show
    @match = Match.find(params[:id])
  end
end
