class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :todo
      t.string :task_item
      t.boolean :complete, default: false
    end
  end
end
