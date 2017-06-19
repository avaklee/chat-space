class MessagesController < ApplicationController
before_action :find_group

  def index
    @message = Message.new
    @messages = Group.find(params[:group_id]).messages
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
      format.html { redirect_to group_messages_path }
      format.json
    end
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
