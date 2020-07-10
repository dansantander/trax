class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false, default: ''
      t.integer :amount, null: false, default: ''
      t.integer :creator_id, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
end
