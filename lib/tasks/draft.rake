require 'rake'

desc "Automatic Draft"
task :draft => :environment do
	# Find remaining drafts
	not_drafted = Draft.where(:player_id => nil)
	if not_drafted.count
		not_drafted.each do |draft|
			free_players = Player.available
			sum = free_players.count
			puts "%s Players Remaining" % [sum]
			if sum
				# Choose a random player
				player = free_players[rand(sum-1)]
				# Assign the player to the team
				draft.player = player
				if draft.save!
					puts "%s drafted %s" % [draft.team.name, player.name]
				else
					puts "Error saving model..."
				end
			else
				break
			end
		end
	end
end