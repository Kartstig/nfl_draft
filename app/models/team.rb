class Team < ActiveRecord::Base
	# Relations
	has_many :drafts
	has_many :players, through: :drafts

	# Validations
	validates_presence_of :name, :division
	#validates_uniqueness_of :name

end
