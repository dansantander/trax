class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon, default: "https://placeimg.com/50/50/tech"
      t.integer :user_id, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
end
