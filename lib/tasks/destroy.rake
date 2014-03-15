desc "Delete data"
task :destroy => [:environment] do
	Team.destroy_all
	Player.destroy_all
	Draft.destroy_all
end