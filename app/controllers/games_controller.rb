class GamesController < ApplicationController

  def index
    @games = Game.all.page(params[:page]).per(3).reverse_order
  end

  def show
    @game = Game.find(params[:id])
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
  end

  def edit
    @address = Address.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:image, :title, :introduction, :total_rate, :site_url)
  end

end
