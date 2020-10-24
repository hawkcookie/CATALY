class AddAnnual < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :annual, :integer
  end
end
