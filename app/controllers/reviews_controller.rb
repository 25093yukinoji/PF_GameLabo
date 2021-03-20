class ReviewsController < ApplicationController
  def index
    @game = Game.find(params[:game_id])
    @reviews = @game.reviews.page(params[:page]).per(10).reverse_order
  end

  def new
    @game = Game.find(params[:game_id])
    @review = Review.new
  end

  def create
    @game = Game.find(params[:game_id])
    @review = Review.new(review_params)
    @review.game_id = @game.id
    @review.user_id = current_user.id
    if @review.save
      redirect_to game_reviews_path(@game.id)
    else
      render 'reviews/new'
    end
  end

  def destroy
    @game = Game.find(params[:game_id])
    review = @game.reviews.find(params[:id])
    review.destroy
    redirect_to request.referer
  end

  private

  def review_params
    params.require(:review).permit(:body, :rate)
  end
end
