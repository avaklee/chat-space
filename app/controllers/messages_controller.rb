class MessagesController < ApplicationController
before_action :find_group

  def index
    @message = Message.new
    @messages = Group.find(params[:group_id]).messages
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      flash[:alert] = "メッセージを入力してください。"
      render :index
    end
  end

private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def find_group
    @group = Group.find(params[:group_id])
  end
end
