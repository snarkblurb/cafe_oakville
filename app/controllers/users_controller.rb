class UsersController < ApplicationController
	
	before_action :logged_in_user, only: [:index, :show, :edit, :update]
	before_action :correct_user, only: [:edit, :update, :show]


	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@events = @user.events.order("day ASC")
	end

  def new
		@user = User.new
  end

	def create
		@user = User.new(user_params)
		@user.admin = admin_email?
		if @user.save
			# Handle a successful save.
			log_in @user
			flash[:success] = "Welcome to Cafe Oakville!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			# Handle a successful update.
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end


	private

		def user_params
			params.require(:user).permit(:name, :email, :password,
																	 :password_confirmation)
		end

		# Before filters

		def logged_in_user
			unless logged_in?
				store_location
				flash[:danger] = "Please log in."
				redirect_to login_url
			end
		end

		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_url) unless ( current_user?(@user) or current_user.admin? )
		end

		def admin_email?
			admin_emails = %w[zakkoltun@gmail.com keithfong25@gmail.com noliewoo@gmail.com
												abraham.choe@gmail.com joeyu51788@gmail.com]
			admin_emails.include? @user.email
		end
		
end
