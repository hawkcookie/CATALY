class ChangeString < ActiveRecord::Migration[5.2]
  def change
    change_column :notifications,:message_id,:string
  end
end
