class GroupsController < ApplicationController

  def index
  end 

  def new
    @group = Group.all
  end

  def edit
  end

private
  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

end
