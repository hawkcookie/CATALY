module RoomsHelper

  # 最新メッセージのデータを取得して表示するメソッド
def most_new_message_preview(room)
  # 最新メッセージのデータを取得する
  message = room.messages.order(updated_at: :desc).limit(1)
  # 配列から取り出す
  message = message[0]
  # メッセージの有無を判定
  if message.present?
    # メッセージがあれば内容を表示
    tag.p "#{message.content}", class: "dm_list__content_time__link__box__message"
  else
    # メッセージがなければ[ まだメッセージはありません ]を表示
    tag.p "[ まだメッセージはありません ]", class: "dm_list__content__link__box__message"
  end
end

def most_new_message_time(room)
  # 最新メッセージのデータを取得する
  message = room.messages.order(updated_at: :desc).limit(1)
  # 配列から取り出す
  message = message[0]
  # メッセージの有無を判定
  if message.present?
    # メッセージがあれば内容を表示
    tag.p "#{message.created_at.strftime('%Y/%m/%d %H:%M')}", class: "dm_list__content__link__box__message"
  else
    # メッセージがなければ[ まだメッセージはありません ]を表示
    tag.p "[ まだメッセージはありません ]", class: "dm_list__content__link__box__message"
  end
end

# 相手ユーザー名を取得して表示するメソッド
def opponent_user(room)
  # 中間テーブルから相手ユーザーのデータを取得
  entry = room.entries.where.not(user_id: current_user)
  # 相手ユーザーの名前を取得
  name = entry.first&.user.present? ? entry.first.user.name : ""
  # 名前を表示
  tag.p "#{name}", class: "dm_list__content__link__box__name"
end


def image_user(room)
  # 中間テーブルから相手ユーザーのデータを取得
  entry = room.entries.where.not(user_id: current_user)
  image = entry.first&.user.present? ? entry.first.user.image : "no_image.png"
  # 相手ユーザーの画像を表示
  if entry.first&.user&.sex == "男性"
    image_tag "#{image}", class: "icon_image_men_dm"
  elsif entry.first&.user&.sex == "女性"
    image_tag "#{image}", class: "icon_image_women_dm"
  elsif entry.first&.user&.sex == "その他"
    image_tag "#{image}", class: "icon_image_other_dm"
  else 
    image_tag "#{image}"
  end
end
end
