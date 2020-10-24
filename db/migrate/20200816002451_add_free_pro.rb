class AddFreePro < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :free_profile, :text
  end
end
