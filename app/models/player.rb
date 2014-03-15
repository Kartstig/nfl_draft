class Player < ActiveRecord::Base
	# Relations
	has_one :draft
	has_one :team, through: :draft

	# Validations
	validates_presence_of :name
	#validates_uniqueness_of :name

	def self.available
		players = Player.all.delete_if { |p| p if p.team }
		if players
			return players
		else
			return false
		end
	end
end
