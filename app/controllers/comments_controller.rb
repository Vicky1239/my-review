class CommentsController < ApplicationController
	def new
		@product=Product.find(params[:product_id])
		@review=@product.reviews.find(params[:review_id])
		@comment=@review.comments.new(review_id: @review.id)
	end

	def index
		@product=Product.find(params[:product_id])
		@review=@product.reviews.find(params[:review_id])
		@comments=@review.comments
	end

	def create
		@product=Product.find(params[:product_id])
		@review=@product.reviews.find(params[:review_id])
		@comment=@review.comments.new(comment_params)
		@comment.user_id=current_user.id
		if @comment.save
			redirect_to product_review_comments_path
		else 
			render 'new'
		end
	end

	def show
		@product=Product.find(params[:product_id])
		@review=@product.reviews.find(params[:review_id])
		@comment=@review.comments.find(params[:id])
		@users=User.all
	end

	def edit
		@product=Product.find(params[:product_id])
		@review=@product.reviews.find(params[:review_id])
		@comment=@review.comments.find(params[:id])
	end

	def update
		@comment=Comment.find(params[:id])
		if @comment.update(comment_params)
			redirect_to product_review_comments_path
		else 
			render 'new'
		end
	end

	def delete
	end
	private
	def comment_params
		params.require(:comment).permit(:title, :comment_body,:review_id,:user_id)
	end
end
