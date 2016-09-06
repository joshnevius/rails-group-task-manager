class CreateUserLists < ActiveRecord::Migration
  def change
    create_table :user_lists do |t|
      t.integer :user_id
      t.integer :list_id
      t.timestamps null: false
    end
  end
end
