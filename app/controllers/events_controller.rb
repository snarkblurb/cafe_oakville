class EventsController < ApplicationController
	before_action :logged_in_user, only: [:index, :create, :destroy]

	def index
		@events = Event.all
		@user = current_user
		@event = @events.build if @user.admin?
	end

  def create
		@events = Event.all
		@event = @events.build(event_params)
		if @event.save
			flash[:success] = "Event created!"
			redirect_to events_path
		else
			render 'static_pages/home'
		end
  end
	
	def destroy
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

end
