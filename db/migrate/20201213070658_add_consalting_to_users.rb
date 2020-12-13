class AddConsaltingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :consalting, :integer
  end
end
