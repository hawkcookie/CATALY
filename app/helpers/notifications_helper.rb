module NotificationsHelper
  def notification_form(notification)
    @message = nil
    visitor = link_to notification.visitor.name, notification.visitor, style: 'font-weight: bold;'
    case notification.action
    when 'message'
      @message = Message.find_by(id: notification.message_id)&.content
      "#{visitor}からメッセージを送られました。"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
