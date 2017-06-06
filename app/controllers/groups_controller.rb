class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group, notice: "グループ登録しました。"
    else
      render 'new'
    end
  end

  def edit
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

end
