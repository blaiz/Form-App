class AddFileTypesToFields < ActiveRecord::Migration
  def up
    change_table :fields do |t|
      t.references :field_type
    end
  end
  
  def down
    remove_column :fields, :field_type_id
  end
end
