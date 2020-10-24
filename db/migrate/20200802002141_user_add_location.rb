class UserAddLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :location, :integer
    add_column :users, :contact, :string
    add_column :users, :uni, :string
    add_column :users, :free, :text
  end
end
