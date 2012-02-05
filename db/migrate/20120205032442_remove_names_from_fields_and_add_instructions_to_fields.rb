class RemoveNamesFromFieldsAndAddInstructionsToFields < ActiveRecord::Migration
  def up
    remove_column :fields, :name
    add_column :fields, :instructions, :text
  end

  def down
    add_column :fields, :name, :string
    remove_column :fields, :instructions
  end
end
