class TeamsController < ApplicationController
	def index
		@teams = Team.all
	end

	def show
		@team = Team.find(params[:id])
		@players = @team.players
	end

	def acquire
		if request.post?
			# Player AND Team are passed to catch simultaneous post errors
			if Draft.latest.acquire(params[:player_id], params[:team_id])
				flash[:success] = "Draft was successful"
				redirect_to players_url
			else
				flash[:warning] = "An error occurred"
				redirect_to players_url
			end
		else
			render text: "Error with post"
		end
	end
end
