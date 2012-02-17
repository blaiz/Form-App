class RenameTypeToGroupTypeInGroups < ActiveRecord::Migration
  def up
    rename_column :groups, :type, :group_type
  end

  def down
    rename_column :groups, :group_type, :type
  end
end
