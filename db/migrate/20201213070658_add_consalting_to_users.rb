class AddConsaltingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :consalting, :integer
    add_column :users, :position, :integer
  end
end
