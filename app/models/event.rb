class Event
	include Mongoid::Document

	#relation
	has_and_belongs_to_many :members, class_name: "User", inverse_of: :joined_events
	belongs_to :owner, class_name: "User", inverse_of: :owned_events
end