class ChangeStringRoomId < ActiveRecord::Migration[5.2]
  def change
    change_column :entries,:room_id,:string
  end
end
