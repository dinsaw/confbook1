class Booking < ActiveRecord::Base
	validates_presence_of :start_time, :end_time
	belongs_to :user
	belongs_to :room
	def overlaps?(other)
		(end_time.to_i >= other.start_time.to_i && other.end_time.to_i >= start_time.to_i)
	end
end