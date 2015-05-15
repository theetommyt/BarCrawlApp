class ChatsController < ApplicationController

  def create

  end

  private

  def chat_params
    params.require(:chat).include(:)
  end

end
