class MessagesController < ApplicationController
before_action :grouping

  def index
    @message = Message.new
    @messages = Group.find(params[:group_id]).messages
  end

  def create
    @message = Message.create(body: message_params[:body], image:message_params[:image], group_id: params[:group_id], user_id: current_user.id)
    if @message.save
      redirect_to group_messages_path
    else
      flash[:alert] = "メッセージを入力してください。"
      render :index
    end
  end

private
  def message_params
    params.require(:message).permit(:body, :image)
  end

  def grouping
    @group = Group.find(params[:group_id])
  end

end
