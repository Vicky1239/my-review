class ProfileController < ApplicationController
	before_action :authenticate_user!
	def home
		if current_user 
			@reviews=current_user.reviews
			@homeproducts=Product.all()
		else
			redirect_to new_user_session_path
		end
	end
	def index 
		@reviews=Review.all
	end
end
