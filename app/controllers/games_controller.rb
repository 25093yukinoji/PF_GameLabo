class GamesController < ApplicationController

  def index
    @games = Game.all.page(params[:page]).per(3).reverse_order
  end

  def show
    @game = Game.find(params[:id])
    @chat = Chat.new
    @chats = @game.chats.page(params[:page]).per(10).reverse_order
    @review = Review.new
    if @game.reviews.blank?
      @average_review = 0
    else
      @average_review = @game.reviews.average(:rate).round(2)
    end
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @game.save
      redirect_to my_page_path
    else
      render :new
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to my_page_path
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def favorites
    @games = current_user.favorite_games.includes(:user).order(created_at: :desc)
  end

  private

  def game_params
    params.require(:game).permit(:image, :title, :introduction, :total_rate, :site_url)
  end

end
