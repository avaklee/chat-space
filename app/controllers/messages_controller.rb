class MessagesController < ApplicationController

  def new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
    else
      flash[:alert] = "メッセージを入力してください。"
      render :new
    end
  end

private
  def message_params
    params.require(:message).permit(:body, :image)
  end

end
