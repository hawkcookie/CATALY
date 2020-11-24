class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :entries, through: :room
  has_many :notifications, dependent: :destroy
  validates :content, presence: true


  def create_notification_message!(current_user,message_id)

    temp_ids = Entry.where(room_id: id).where.not(user_id: current_user.id).distinct


    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['room_id'])
    end

    save_notification_message!(current_user, message_id, room_id) if temp_ids.blank?
  end




  def save_notification_message!(current_user, message_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      room_id: user_id,
      message_id: message_id,
      visited_id: visited_id,
      action: 'message'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
