class StaticPagesController < ApplicationController
  def home
		set_user
  end

  def menu
		set_user
  end

	def signin
	end

	def about
		set_user
	end

	def activities
		set_user
	end

	private

		def set_user
			if current_user
				@user = current_user
			end
		end
	
end
