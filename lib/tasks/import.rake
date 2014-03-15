require 'csv'
require 'rake'

desc "Import data"
task :import => :environment do

	# Import Teams
	file = 'teams.csv'
	# Note: Use tab delimiter. Had issues with column
	# separation with just comma delimiting.
	CSV.foreach(file, {:headers => true, :col_sep => "\t"} ) do |row|
		puts "NAME: %s | DIVISION: %s" % [row[0], row[1]]
		Team.create({
			:name => row[0],
			:division => row[1]
		})
	end

	# Import Players
	file = 'players.csv'
	CSV.foreach(file, {:headers => true, :col_sep => "\t"} ) do |row|
		puts "NAME: %s | POSITION: %s" % [row[0], row[1]]
		Player.create({
			:name => row[0],
			:position => row[1]
		})
	end

	# Import Draft Order
	file = 'order.csv'
	CSV.foreach(file, {:headers => true, :col_sep => "\t"} ) do |row|
		team = Team.find(row[3])
		puts "ROUND: %s | PICK: %s | TEAM: %s" % [row[0], row[1], team.name]
		Draft.create({
			:round => row[0],
			:pick => row[1],
			# Foreign Key
			:team => team
		})
	end
end