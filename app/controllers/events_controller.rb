class EventsController < ApplicationController
	before_action :logged_in_user, only: [:index, :create, :destroy]
	before_action :correct_user, only: :destroy

	def index
		@events = Event.all.order("day ASC")
		@user = current_user
		@event = @events.build if @user.admin?
	end

  def create
		@events = Event.all.order("day ASC")
		@event = @events.build(event_params)
		if @event.save
			flash[:success] = "Event created!"
			redirect_to events_path
		else
			render 'static_pages/home'
		end
  end
	
	def destroy
		@event.destroy
		flash[:success] = "Event deleted"
		redirect_to events_path
	end

	private

		def event_params
			params.require(:event).permit(:day)
		end
		
		def logged_in_user
			if !logged_in?
				flash[:danger] = "Please log in."
				redirect_to(login_url) 
			end
		end

		def correct_user
			@event = Event.find_by(id: params[:id])
			redirect_to root_url if @event.nil?
		end

end
