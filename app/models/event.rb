class Event
	include Mongoid::Document

	#relation
	has_and_belongs_to_many :users
end