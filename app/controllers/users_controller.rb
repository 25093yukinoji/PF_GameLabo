class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    @games = @user.games.all.page(params[:page]).per(3).reverse_order
  end
end
