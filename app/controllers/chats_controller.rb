class ChatsController < ApplicationController

  def create
    @game = Game.find(params[:game_id])
		@chat = Chat.new(chat_params)
		@chat.game_id = @game.id
		@chat.user_id = current_user.id
		if @chat.save
  		redirect_to game_path(@game.id)
		else
		  render 'games/show'
		end
  end

  def destroy
    @game = Game.find(params[:game_id])
    chat = @game.chats.find(params[:id])
		chat.destroy
		redirect_to request.referer
  end

  private

	def chat_params
		params.require(:chat).permit(:comment)
	end
end
