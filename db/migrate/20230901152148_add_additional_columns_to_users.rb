class AddAdditionalColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string, default: "", null: false
    add_column :users, :encrypted_password, :string, default: "", null: false
    add_column :users, :confirmed, :boolean, default: true
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :confirmed_at, :datetime, default: -> { "CURRENT_TIMESTAMP" }
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string
    add_column :users, :remember_created_at, :datetime
  end
end
