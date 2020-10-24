class AddWorkUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :work, :integer
  end
end
