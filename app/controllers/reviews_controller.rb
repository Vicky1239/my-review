class ReviewsController < ApplicationController
	def new
		# @p_id=params[:id].to_i
		@product = Product.find(params[:product_id])
		@review=@product.reviews.new(product_id: @product.id)
	end
	def index
		@product=Product.find(params[:product_id])
		@reviews=@product.reviews
		
	end
	def create
		#@p_id=params[:id].to_i
		@product=Product.find(params[:product_id])
		@review=@product.reviews.new(review_params)
		@review.user_id = current_user.id
		if @review.save
			redirect_to product_reviews_path
		else 
			render 'new'
		end
	end
	def show
		@product=Product.find(params[:product_id])
		@review=Review.find(params[:id])
	end
	def edit
		@product=Product.find(params[:product_id])
		#@review=Review.find(params[:id])
		@review=@product.reviews.find(params[:id])
	end
	def update
		@review = Review.find(params[:id])
	    if @review.update(review_params)
	    	redirect_to product_reviews_path
	    else 
			render 'edit'
		end
		end
	def destroy
		@review=Review.find(params[:id])
		if @review.destroy
			redirect_to product_reviews_path, notice: 'Product was successfully destroyed.'
		end
	end
private
	def review_params
		params.require(:review).permit(:rating, :review_body,:product_id,:user_id)
	end

end
