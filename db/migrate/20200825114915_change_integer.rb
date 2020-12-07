class ChangeInteger < ActiveRecord::Migration[5.2]
  def up
    change_column :notifications,:message_id,:integer
  end
end
