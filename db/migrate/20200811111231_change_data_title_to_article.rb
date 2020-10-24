class ChangeDataTitleToArticle < ActiveRecord::Migration[5.2]
  def change
    change_column :users,:location,:integer
  end
end
