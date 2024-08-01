class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false

      t.timestamps
    end
    # add_index :table_name, :column_name, options: "custom_index_name"
    # why we need add index here?
    add_index :users, :email, unique:  true
  end
end
