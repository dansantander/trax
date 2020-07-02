class CreateGroupings < ActiveRecord::Migration[5.2]
  def change
    create_table :groupings do |t|
      t.integer :task_id, index: true
      t.integer :group_id, index: true

      t.timestamps
    end
  end
end
