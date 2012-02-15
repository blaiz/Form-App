class RemoveOwnerIdFromForms < ActiveRecord::Migration
  def up
    remove_column :forms, :owner_id
      end

  def down
    add_column :forms, :owner_id, :string
  end
end
