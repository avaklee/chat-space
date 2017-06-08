module ApplicationHelper

  def show_group_name(group)
    group.name
  end

  def show_last_message(group)
    if group.messages.present?
      group.messages.last.body
    else
      "まだメッセージはありません。"
    end
  end
end
