class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :list_id
      t.string :name
      t.boolean :status, :default => "Task not complete."

      t.timestamps null: false
    end
  end
end
