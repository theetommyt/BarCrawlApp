class ChatsController < ApplicationController

  def create
    if drinker = current_user
      chat = Chat.create(chat_params)
      drinker.chats << chat
      chat.save!
    end
    redirect_to '/'
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end

end
