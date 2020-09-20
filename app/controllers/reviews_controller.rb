class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        @product.calculate_rating
        format.html {redirect_to @review.product, notice: 'Review was successfully created' }
        format.js
        format.json {render json: @review, status: :created, location: @user}
      else
        format.html { render 'products/show' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @review = Review.find(params[:id])
    @product = @review.product
    @comment = @review.comments.new
  end

private

  def review_params
    params.require(:review).permit :content, :rating
  end
end
