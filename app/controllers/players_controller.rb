class PlayersController < ApplicationController
	def index
		@players = Player.all
		@draft = Draft.latest
	end

	def show
		if params[:id]
			@player = Player.find(params[:id])
		end
	end

	# List Available Players
	def available
		@players = Player.available
		@draft = Draft.latest
	end
end
