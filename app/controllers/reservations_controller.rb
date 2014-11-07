class ReservationsController < ApplicationController

	def create
		@reservation = Reservation.new(reservation_params)
		if @reservation.save
			redirect_to events_path
		else
			flash.now[:danger] = "Reservation failed"
		end
	end

	def destroy
		reservation = Reservation.find_by(event_id: params[:reservation][:event_id],
																			user_id: params[:reservation][:user_id])
		reservation.destroy
		redirect_to events_path
	end

	private
		
		def reservation_params
			params.require(:reservation).permit(:user_id, :event_id)
		end

end
