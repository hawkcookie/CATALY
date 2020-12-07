class ChangeStringRoom < ActiveRecord::Migration[5.2]
  def up
    change_column :entries,:room_id,:integer
  end
end
