class MessagesController < ApplicationController
# before_action :move_to_index, except: :index
  def index
  end



private
  # def move_to_index
  #   redirect_to action: :index unless user_signed_in?
  # end

  def message_params
    params.permit(:name,:email)
  end

end
