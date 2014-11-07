class EventsController < ApplicationController
	before_action :logged_in_user, only: [:index]

	def index
		@events = Event.all
		@user = current_user
	end

  def new
  end


	private
		
		def logged_in_user
			redirect_to(login_url) unless logged_in?
		end

end
