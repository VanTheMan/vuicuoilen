class Notification
	include Mongoid::Document
	
	#relation
	belongs_to :user

end