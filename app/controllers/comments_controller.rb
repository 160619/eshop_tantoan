class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html {redirect_to @review.product, notice: 'Comment was successfully created' }
        format.js
        format.json {render json: @comment, status: :created, location: @user}
      else
        format.html { render 'products/show' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit :body, :review_id, :user_id
  end
end
