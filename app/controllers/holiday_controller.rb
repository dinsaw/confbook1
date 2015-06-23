class HolidayController < ApplicationController
	def index
		
	end
	def new
		
	end
	def new_holiday
		holiday = Holiday.new()
		holiday.h_date =  Date.parse(params[:holiday_Date])
		if holiday.save
			render json:{message:"Holiday Added."}
		else
			render json:{message:"Error."}
		end
	end
end
