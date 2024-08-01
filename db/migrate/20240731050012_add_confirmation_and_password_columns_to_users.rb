# rails g migration add_confirmation_and_password_columns_to_users confirmed_at:datetime password_digest:string
class AddConfirmationAndPasswordColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :confirmed_at, :datetime
    add_column :users, :password_digest, :string, null: false
  end
end
