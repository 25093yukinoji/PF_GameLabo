class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_games = current_user.favorite_games.page(params[:page]).per(5).reverse_order
  end

  def favorite
    @game = Game.find(params[:game_id])
    @id_name = "#favorite-link-#{@game.id}"
    favorite = current_user.favorites.new(game_id: @game.id)
    favorite.save
  end

  def unfavorite
    @game = Game.find(params[:game_id])
    @id_name = "#favorite-link-#{@game.id}"
    favorite = current_user.favorites.find_by(game_id: @game.id)
    favorite.destroy
  end
end
