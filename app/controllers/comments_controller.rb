class CommentsController < ApplicationController
  def new

    @review = Review.find(params[:review_id])
    @comment = @review.comments.new
  end

  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new(comment_params)
    if @comment.save
      redirect_to product_path(@review.product_id), notice: 'created comment successfully'
    else
      render 'products/show'
    end
  end

private

  def comment_params
    params.require(:comment).permit :body, :review_id
  end
end
