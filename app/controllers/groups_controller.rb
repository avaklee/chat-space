class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end 

  def new
    @group = Group.new
  end

  def create
  end

  def edit
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

end
