class RoomsController < ApplicationController
	def index
		@rooms = Room.all
		render json: @rooms
	end
	def new
	end
	def new_room
		room = Room.new
		room.name = params[:room_name]
		if room.save
			render json:{message:"Room Added."}
		else
			render json:{message:"Error."}
		end
	end
	
	def create
		@room = Room.new(room_params)
		@room.save
		redirect_to @room
	end
	
	def show
		@room = Room.find(params[:id])
	end

	private
	def room_params
		params.require(:room).permit(:name)
	end
end
