class ChangeInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :notifications,:message_id,:integer
  end
end
