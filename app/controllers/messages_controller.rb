class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to controller: 'groups', action: 'index'
    else
      flash[:alert] = "メッセージを入力してください。"
    end
  end

private
  def message_params
    params.require(:message).permit(:body, :image)
  end

end
