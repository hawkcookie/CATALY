class AddClubAndSubject < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :club, :integer

    add_column :users, :subject, :integer
  end
end
