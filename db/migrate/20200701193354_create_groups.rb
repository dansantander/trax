class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon, default: "https://placeimg.com/50/50/tech"

      t.timestamps
    end
  end
end
