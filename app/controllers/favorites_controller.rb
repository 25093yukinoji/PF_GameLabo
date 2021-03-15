class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_variables
  # 保留
  # def index
  #   @favolites = current_user.favorite(@game).all
  # end

  def favorite
    favorite = current_user.favorites.new(game_id: @game.id)
    favorite.save
  end

  def unfavorite
    favorite = current_user.favorites.find_by(game_id: @game.id)
    favorite.destroy
  end

  private

  def set_variables
    @game = Game.find(params[:game_id])
    @id_name = "#favorite-link-#{@game.id}"
  end

end
