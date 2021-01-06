class AddSendMailToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :send_mail, :boolean, default: true, null: false
  end
end
