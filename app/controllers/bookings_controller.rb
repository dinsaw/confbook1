class BookingsController < ApplicationController
	def my_logger
    @@my_logger ||= Logger.new("#{Rails.root}/log/my.log")
  	end
	def index
		
	end
	def select_by_room
		@room = Room.find(params[:id])
		@bookings = @room.bookings
		render json:@bookings,  :include=> [:user]
	end
	def new_booking
		@room = Room.find(params[:room_id])
		@user = User.find(session[:user_id])

		booking = Booking.new
		booking.date = Date.parse(params[:booking_date])
		booking.start_time = booking.date.to_datetime + Time.parse(params[:start]).seconds_since_midnight.seconds 
		booking.end_time = booking.date.to_datetime + Time.parse(params[:end]).seconds_since_midnight.seconds
		booking.room = @room
		booking.user = @user

		if booking.date.saturday? || booking.date.sunday?
			render json:{message:"Booking Not Possible. It is weekend."}
			return
		end
		if Holiday.find_by_h_date(booking.date) != nil
			render json:{message:"Booking Not Possible. It is Holiday."}
			return
		end
		other_bookings =  Booking.where(date:Date.parse(params[:booking_date]), room:@room)

		my_logger.info("other booking#{other_bookings}")
		overlap = false
		other_bookings.each do |ob|
			if ob.overlaps?(booking) 
				my_logger.info("overlap tru #{ob.user.id} with #{booking.user.id}")
				if ob.user.id == booking.user.id
					my_logger.info("destroy tru")
					ob.destroy
				else
					overlap = true
				end
			end
		end
		if overlap
			render json:{message:"Booking Not Possible. Same slot is booked by another user for same room."}	
		else
			booking.save
			render json:{message:"Booking Done."}
		end
	end
	def show
		@booking = Booking.find(params[:id])
	end

end
