class RemoveWeightFromFields < ActiveRecord::Migration
  def up
    remove_column :fields, :weight
  end

  def down
    add_column :fields, :weight, :integer
  end
end
