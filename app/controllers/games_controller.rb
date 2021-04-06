class GamesController < ApplicationController

  before_action :ensure_correct_user, only: [:edit, :destroy]

  def index
    @q = Game.ransack(params[:q])
    @games = @q.result(distinct: true)
    @games = Game.all.page(params[:page]).per(5).reverse_order
  end

  def show
    @game = Game.find(params[:id])
    @chat = Chat.new
    @chats = @game.chats.page(params[:page]).per(10).reverse_order
    @review = Review.new
    @game.total_rate = if @game.reviews.blank?
                         0
                       else
                         @game.reviews.average(:rate).round(2)
                       end
    @game.save
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
  end

  def favorites
    @games = current_user.favorite_games.includes(:user).order(created_at: :desc)
  end

  def rank
    @ranking = Game.all.order(total_rate: :DESC).limit(10)
    @base_of_ranking = 0
  end

  def search
    @q = Game.search(search_params)
    @games = @q.result(distinct: true).page.per(5).reverse_order
  end

  private

  def search_params
    params.require(:q).permit!
  end

  def game_params
    params.require(:game).permit(:image, :title, :introduction, :total_rate, :site_url)
  end

  def ensure_correct_user
    @game = Game.find(params[:id])
    unless @game.user == current_user
      redirect_to my_page_path
    end
  end
end
