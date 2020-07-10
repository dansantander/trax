class AddAvatarToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :avatar, :string
  end
end
