class ResultsController < ApplicationController
	# View Last 3 Drafts
	def index
		@drafts = Draft.last_three
		@next = Draft.latest
	end

	# View by Round
	def round
		if params[:round]
			@drafts = Draft.where(:round => params[:round])

			# Need to add a redirect here for bad requests
		end
	end

	# View All
	def all
		@drafts = Draft.all
	end

end
