class Draft < ActiveRecord::Base
	# Relations
	belongs_to :player
	belongs_to :team

	# Validations
	validates_presence_of :round, :pick, :team_id

	def self.latest
		not_drafted = self.where(:player_id => nil).first
		if not_drafted
			return not_drafted
		else
			return false
		end
	end

	def self.last_three
		drafted = Draft.all.keep_if { |d| d if d.player }
		if drafted
			return drafted.last(3)
		else
			return false
		end
	end

	def acquire(player_id, team_id)
		player = Player.find(player_id)
		latest = self.class.latest
		if team_id.to_i == latest.team.id
			player.draft = latest
			return player.save!
		else
			return false
		end
	end
end
